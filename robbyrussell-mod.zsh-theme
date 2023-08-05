SPECIAL="%T"

# Show different prefix if last command succeeded/failed
PROMPT="%(?:"
# Success
PROMPT+="%{$FG[240]%}[$fg[yellow]$SPECIAL%u$FG[240]] %{$fg[green]%}"
# Or
PROMPT+=":"
# Fail
PROMPT+="%{$FG[240]%}[$fg[yellow]$SPECIAL%u$FG[240]] %{$fg[red]%})"

# user + git status
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:(%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
