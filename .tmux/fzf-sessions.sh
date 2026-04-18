#!/bin/sh

. "$(dirname "$0")/fzf-colors.sh"

tmux list-sessions -F '#{?session_attached,,#{session_name}}' | \
  sed '/^$/d' | \
  fzf --reverse --header ' Sessions' --prompt ' > ' \
    --no-scrollbar --no-info --no-separator \
    --border none --margin 0 --padding 0 \
    --pointer '▶' \
    --color="$FZF_COLOR" | \
  xargs tmux switch-client -t
