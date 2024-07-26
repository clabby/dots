# user + git status
TIME="%{$fg[grey]%}[%T]%{$reset_color%}"
DIR="%{$fg[blue]%}%c%{$reset_color%}"
DELIM="%{$fg[red]%}|%{$reset_color%}"
PROMPT='$TIME $DIR$(git_prompt_info) $DELIM '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[grey]%}:%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[grey]%}%{$fg[grey]%} %{$fg[yellow]%}%{$fg[grey]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[grey]%}"

