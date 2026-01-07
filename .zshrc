# -------------------
# Shell configuration
# -------------------

# Edit input in $EDITOR
bindkey '^n' edit-command-line

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Starship init
eval "$(starship init zsh)"

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fpath+="$HOMEBREW_PREFIX"/share/zsh/site-functions

# Source oh-my-zsh
source "$ZSH/oh-my-zsh.sh"

# ZSH syntax highlighting
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# -----------------
# App configuration
# -----------------

# FZF
[ -f ~/.fzf.zsh ] && source "$HOME/.fzf.zsh"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zoxide
eval "$(zoxide init zsh)"

# -------
# ENV
# -------

# Set preferred editor for local and remote sessions
export EDITOR='nvim'

# Set manpath
export MANPATH="/usr/local/man:$MANPATH"

# Add local bins to path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.foundry/bin"

# tmux colors
export TERM=xterm-256color

# -----------
# Completions
# -----------

eval "$(cast completions zsh)"
eval "$(gh completion -s zsh)"
eval "$(just --completions bash)"
eval "$(jj util completion zsh)"

# -------
# ALIASES
# -------

# gm routine
alias gm='rustup update && (z neovim && git pull origin master && rm -rf build && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install)'

# jj
alias j="jj"
alias ju="jjui"

# Cargo
alias cg="cargo"
alias stone="cargo +nightly fmt -- && cargo clippy --all --all-features -- -D warnings"
alias rock="cargo +nightly fmt"
alias nt="cargo nextest"
alias nnt="cargo +nightly nextest"
alias spring-clean="cargo clean-all --keep-days 7 ~ -y"

# Go
alias gts="gotestsum --format=testname"

# Neovim
alias n="nvim -i NONE"

# Misc
alias c="clear"

# PNPM
alias p="pnpm"

# lazygit
alias lg="lazygit"

# git
alias g="git"
alias gco="git checkout"
alias gcn="git checkout -b"
alias gcod="git checkout develop"
alias gpod="git pull origin develop"
alias gcom="git checkout main"
alias gpom="git pull origin main"
alias gcoM="git checkout master"
alias gpoM="git pull origin master"

# Grep
function rgg {
    rg $@ --json | delta
}

# Tmux
function t {
    if [ -n "$1" ]; then
        tmux new -s "$1"
    else
        tmux new -s code
    fi
}

# Cat
alias cat="bat"

# Delta
alias diff="delta"

# lsd aliases
alias ls="lsd"
alias la="lsd -lah"
alias ll="lsd -lh"
alias lt="lsd --tree"

# Wttr
CITY="Atlanta"
wttr() {
    if [ "$1" = "-v2" ]; then
        curl -L "https://v2.wttr.in/$CITY?u"
    else
        curl -L "https://wttr.in/$CITY?u"
    fi
}

# ------------
# `gh` aliases
# ------------

# Search through all PRs that are open in the current repo and open the selected one in browser.
alias prv="GH_FORCE_TTY=100% gh pr list -L 1000 | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 4 | cut -d' ' -f1 | tr -d '#' | xargs gh pr view -w"

prd() {
    open_pr="$(GH_FORCE_TTY=100% gh pr list -L 1000 |
        fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 4 |
        cut -d' ' -f1 |
        tr -d '#' |
        xargs gh pr view --json baseRefName,headRefName,headRepository,headRepositoryOwner
    )"

    local base_ref=$(echo $open_pr | jq -r '.baseRefName')
    local head_ref=$(echo $open_pr | jq -r '.headRefName')
    local head_repo_name=$(echo $open_pr | jq -r '.headRepository.name')
    local head_repo_owner=$(echo $open_pr | jq -r '.headRepositoryOwner.login')
    local head_repo="$head_repo_owner/$head_repo_name"

    local local_ref="refs/remotes/prd/${head_repo//\//_}/$head_ref"
    git fetch "https://github.com/$head_repo.git" "$head_ref:$local_ref" --quiet || {
        echo "Failed to fetch $head_repo:$head_ref"
        return 1
    }

    nvim -c "Difft $base_ref@origin..$local_ref@origin"
}

# Search through all PRs that are open in the current repo and that I'm requested to review and open the selected one in browser.
alias prr="GH_FORCE_TTY=100% gh pr list --search 'user-review-requested:@me' | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | cut -d' ' -f1 | tr -d '#' | xargs gh pr view -w"

# Search through all open issues and open the selected one in browser.
alias is="GH_FORCE_TTY=100% gh issue list -L 1000 | fzf --ansi --preview 'GH_FORCE_TTY=100% gh issue view {1}' --preview-window down --header-lines 4 | cut -d' ' -f1 | tr -d '#' | xargs gh issue view -w"

# Search through all open issues assigned to me and open the selected one in browser.
alias isa="GH_FORCE_TTY=100% gh issue list -L 1000 --search 'assignee:@me' | fzf --ansi --preview 'GH_FORCE_TTY=100% gh issue view {1}' --preview-window down --header-lines 4 | cut -d' ' -f1 | tr -d '#' | xargs gh issue view -w"

# Search through all PRs that are open in the current repo and check the selected one out locally.
alias prc="GH_FORCE_TTY=100% gh pr list -L 1000 | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 4 | cut -d' ' -f1 | tr -d '#' | xargs gh pr checkout"

alias gst="gh status"

# Open the repo in-browser
repo() {
    if type gh &> /dev/null; then
        gh repo view -w
    else
        echo "gh is not installed"
    fi
}

# Create a new PR
cpr() {
    if type gh &> /dev/null; then
        gh pr create --head $(jj log -r 'bookmarks() & ancestors(@)' -n 1 -T 'bookmarks ++ "\n"' --no-graph --color=never)
    else
        echo "gh is not installed"
    fi
}

# Search through all PRs that meet a supplied filter and open the selected one in browser.
prf() {
    if type gh &> /dev/null; then
        if [ $# -eq 1 ]; then
            GH_FORCE_TTY=100% gh pr list --search "$@" | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | cut -d' ' -f1 | tr -d '#' | xargs gh pr view -w
        else
            echo "Filter arguments are required."
        fi
    else
        echo "gh is not installed"
    fi
}

# Clipboard
xc() {
    if [ "$(uname)" = "Darwin" ]; then
        pbcopy
    else
        xclip -selection clipboard
    fi
}

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# opencode
export PATH=/Users/ben/.opencode/bin:$PATH

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/ben/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
