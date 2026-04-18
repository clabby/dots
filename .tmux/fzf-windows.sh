#!/bin/sh

. "$(dirname "$0")/fzf-colors.sh"

tmux list-windows -F '#{window_index} #{window_name}' | \
  sed '/^$/d' | \
  fzf --reverse --header ' Windows' --prompt ' > ' \
    --no-scrollbar --no-info --no-separator \
    --border none --margin 0 --padding 0 \
    --pointer '▶' \
    --color="$FZF_COLOR" | \
  cut -d ' ' -f 1 | \
  xargs tmux select-window -t
