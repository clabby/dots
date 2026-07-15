#!/bin/sh

. "$(dirname "$0")/fzf-colors.sh"

choose() {
  header="$1"
  prompt="$2"
  shift 2

  fzf --reverse --header "$header" --prompt "$prompt" \
    --height=10% \
    --ansi \
    --no-scrollbar --no-info --no-separator \
    --border none --margin 0 --padding 0 \
    --pointer '▶' \
    --color="$FZF_COLOR" \
    "$@"
}

log_error() {
  message="$1"

  printf '%s\n' "$message" >&2
  tmux display-message "$message"
}

current_level() {
  pane_size="$1"
  window_size="$2"

  if [ "$window_size" -eq 0 ]; then
    return
  fi

  if [ $((pane_size * 100 % window_size)) -ne 0 ]; then
    return
  fi

  level="$((pane_size * 100 / window_size))"

  if [ "$level" -lt 5 ] || [ "$level" -gt 95 ]; then
    return
  fi

  if [ $((level % 5)) -ne 0 ]; then
    return
  fi

  printf '%s\n' "$level"
}

level_options() {
  current="$1"

  seq 5 5 95 | while IFS= read -r level; do
    if [ "$level" = "$current" ]; then
      printf '%s\t\033[90m%s\033[0m\n' "$level" "$level"
      continue
    fi

    printf '%s\t%s\n' "$level" "$level"
  done
}

pane="${1:-}"

if [ -z "$pane" ]; then
  pane="$(tmux display-message -p '#{pane_id}')"
fi

direction="$(
  printf '%s\n' vertical horizontal | \
    choose ' Resize' ' > '
)" || exit 0

[ -n "$direction" ] || exit 0

case "$direction" in
  vertical)
    pane_size="$(tmux display-message -pt "$pane" '#{pane_height}')"
    window_size="$(tmux display-message -pt "$pane" '#{window_height}')"
    ;;
  horizontal)
    pane_size="$(tmux display-message -pt "$pane" '#{pane_width}')"
    window_size="$(tmux display-message -pt "$pane" '#{window_width}')"
    ;;
esac

if [ "$pane_size" = "$window_size" ]; then
  log_error "Cannot resize $direction: pane already occupies 100% of that plane"
  exit 1
fi

current="$(current_level "$pane_size" "$window_size")"

while :; do
  level="$(
    level_options "$current" | \
    choose ' Resize %' 'Select Level > ' --delimiter='\t' --with-nth=2 | \
    cut -f 1
  )" || exit 0

  [ -n "$level" ] || exit 0

  if [ "$level" != "$current" ]; then
    break
  fi

  log_error "Cannot resize $direction to $level%: pane is already at that level"
done

case "$direction" in
  vertical)
    tmux resize-pane -t "$pane" -y "$level%"
    ;;
  horizontal)
    tmux resize-pane -t "$pane" -x "$level%"
    ;;
esac
