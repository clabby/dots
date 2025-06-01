# -------------------
# Shell configuration
# -------------------

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
export PATH="$PATH:$HOME/.foundry/bin"
export PATH="$PATH:$HOME/.huff/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"

export ETH_RPC=https://eth-mainnet.g.alchemy.com/v2/Y2SGiriVdroLNFmXB6TzCAOTV4RPbotK
export OP_MAINNET_ANTON=http://anton.clab.by:8547
export OP_SEPOLIA_ANTON=http://anton.clab.by:8548
export ETH_ANTON=http://anton.clab.by:8545
export SEPOLIA_ANTON=http://anton.clab.by:8546
export ETH_RPC_URL=$ETH_ANTON

# tmux colors
export TERM=xterm-256color

export OP_MONOREPO="$HOME/dev/optimism/monorepo"

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

# jj
alias j="jj"
alias ju="jjui"

# Cargo
alias cg="cargo"
alias stone="cargo +nightly fmt -- && cargo +nightly clippy --all --all-features -- -D warnings"
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

# Forge shortcuts
ft() {
    if [ $# -ge 1 ]; then
        forge test "$@"
    else
        forge test
    fi
}
ftt() {
    if [ $# -ge 1 ]; then
        forge test --match-test "$@"
    fi
}
ftc() {
    if [ $# -ge 1 ]; then
        forge test --match-contract "$@"
    fi
}

# Forge ETH RPCs
rpc() {
    if [ "$1" = "eth" ]; then
        export ETH_RPC_URL=$ETH_ANTON
    elif [ "$1" = "sepolia" ]; then
        export ETH_RPC_URL=$SEPOLIA_ANTON
    elif [ "$1" = "op" ]; then
        export ETH_RPC_URL=$OP_MAINNET_ANTON
    elif [ "$1" = "op-sepolia" ]; then
        export ETH_RPC_URL=$OP_SEPOLIA_ANTON
    else
        export ETH_RPC_URL=""
    fi
}

# ------------
# `gh` aliases
# ------------

# Search through all PRs that are open in the current repo and open the selected one in browser.
alias prv="GH_FORCE_TTY=100% gh pr list -L 1000 | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 4 | cut -d' ' -f1 | tr -d '#' | xargs gh pr view -w"

# Search through all PRs that are open in the current repo and check the selected one out locally.
alias prc="GH_FORCE_TTY=100% gh pr list -L 1000 | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 4 | cut -d' ' -f1 | tr -d '#' | xargs gh pr checkout"

# Search through all PRs that are open in the current repo and that I'm requested to review and
# open the selected one in browser.
alias prr="GH_FORCE_TTY=100% gh pr list --search 'user-review-requested:@me' | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | cut -d' ' -f1 | tr -d '#' | xargs gh pr view -w"

# Search through all open client-pod issues and open the selected one in browser.
alias is="GH_FORCE_TTY=100% gh issue list -L 1000 | fzf --ansi --preview 'GH_FORCE_TTY=100% gh issue view {1}' --preview-window down --header-lines 4 | cut -d' ' -f1 | tr -d '#' | xargs gh issue view -w"
# Search through all open client-pod issues assigned to me and open the selected one in browser.
alias isa="GH_FORCE_TTY=100% gh issue list -L 1000 --search 'assignee:@me' | fzf --ansi --preview 'GH_FORCE_TTY=100% gh issue view {1}' --preview-window down --header-lines 4 | cut -d' ' -f1 | tr -d '#' | xargs gh issue view -w"

alias gst="gh status"

# Open the repo in-browser
repo() {
    if type gh &> /dev/null; then
        gh repo view -w
    else
        echo "gh is not installed"
    fi
}

# Open the github TUI
ghd() {
    if type gh &> /dev/null; then
        gh dash
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
