# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# THEME
ZSH_THEME="robbyrussell"

# Arch or Mac
IS_DARWIN=false

# PLUGINS
plugins=(git)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ZSH syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ------------------
# User configuration
# ------------------

# vi mode
# set -o vi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="/Users/ben/Library/pnpm"
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

# If we're not on Mac OSX, include the go binary in `/usr/local/go/bin`
if [ "$IS_DARWIN" = false ]; then
    export PATH="$PATH:/usr/local/go/bin"
fi

# Add local bins to path
export PATH="$PATH:$HOME/.foundry/bin"
export PATH="$PATH:$HOME/.huff/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$(go env GOPATH)/bin"

export ETH_RPC=https://eth-mainnet.g.alchemy.com/v2/Y2SGiriVdroLNFmXB6TzCAOTV4RPbotK
export OP_RPC=https://opt-mainnet.g.alchemy.com/v2/VHd82Uv7lrm75SCeT-lc7dKzElyFNeuy
export ETH_ANTON=http://anton.clab.by:8545
export SEPOLIA_ANTON=http://anton.clab.by:8546
export GOERLI_RPC=https://eth-goerli.g.alchemy.com/v2/W2407fvgSZ35fJMXgNHOYXW6rc4Unt8y
export ETH_RPC_URL=$ETH_ANTON

# tmux colors
export TERM=xterm-256color

export OP_MONOREPO="$HOME/dev/op/monorepo"

# -----------
# Completions
# -----------

eval $(cast completions zsh)
eval $(gh completion -s zsh)
eval $(gt completion zsh)

# -------
# ALIASES
# -------

# Optimism Dev
alias oprefresh="z $OP_MONOREPO && nx reset && p clean && p build"
alias opr="z $OP_MONOREPO/packages/contracts-bedrock && p gas-snapshot && p semver-lock && p lint && p storage-snapshot && forge clean && (z $OP_MONOREPO/op-bindings && make)"
alias foundryup-op="foundryup -C $(cat $OP_MONOREPO/versions.json | jq -r .foundry)"

# Go
alias gts="gotestsum --format=testname"

# Graphite
alias gs="gt sync"
alias gco="gt co"
alias gsr="gt restack"

# Cargo
alias cg="cargo"
alias stone="cargo +nightly fmt -- && cargo +nightly clippy --all --all-features -- -D warnings"
alias rock="cargo +nightly fmt"
alias nt="cargo nextest"
alias nnt="cargo +nightly nextest"

# Reth development
alias rethtest='cargo nextest run --locked --all-features --workspace --exclude examples --exclude ef-tests -E '\''kind(lib)'\'' -E '\''kind(bin)'\'' -E '\''kind(proc-macro)'\'
alias rethfmt='cargo +nightly fmt --all'
alias rethlint='rethfmt && rethclip'
alias rethclip='cargo +nightly clippy --all --all-features -- -A clippy::non_canonical_clone_impl -A clippy::arc_with_non_send_sync'

# Oxker (Docker TUI)
alias ox="oxker"

# Neovim
alias n="nvim -i NONE"

# Misc
alias c="clear"

# PNPM
alias p="pnpm"

# SSH
alias sa="ssh ben@anton.clab.by"

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
alias lt="lsd -la --tree --depth 2"

# Wttr
CITY="Amsterdam"
wttr() {
    if [ "$1" = "-v2" ]; then
        curl -L https://v2.wttr.in/$CITY
    else
        curl -L https://wttr.in/$CITY
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
        export ETH_RPC_URL=$OP_RPC
    elif [ "$1" = "goerli" ]; then
        export ETH_RPC_URL=$GOERLI_RPC
    else
        export ETH_RPC_URL=""
    fi
}

# ------------
# `gh` aliases
# ------------

# Search through all PRs that are open in the current repo and check the selected one out locally.
alias prc="GH_FORCE_TTY=100% gh pr list -L 1000 | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | cut -d' ' -f1 | tr -d '#' | xargs gh pr checkout"

# Search through all PRs that are open in the current repo and open the selected one in browser.
alias prv="GH_FORCE_TTY=100% gh pr list -L 1000 | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | cut -d' ' -f1 | tr -d '#' | xargs gh pr view -w"

# Search through all PRs that are open in the current repo and that I'm requested to review and
# open the selected one in browser.
alias prr="GH_FORCE_TTY=100% gh pr list --search 'user-review-requested:@me' | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | cut -d' ' -f1 | tr -d '#' | xargs gh pr view -w"

CLI_ISSUES="ethereum-optimism/client-pod"
# Search through all open client-pod issues and open the selected one in browser.
alias oi="GH_FORCE_TTY=100% gh issue list -R $CLI_ISSUES -L 1000 | fzf --ansi --preview 'GH_FORCE_TTY=100% gh issue -R $CLI_ISSUES view {1}' --preview-window down --header-lines 3 | cut -d' ' -f1 | tr -d '#' | xargs gh issue -R $CLI_ISSUES view -w"
# Search through all open client-pod issues assigned to me and open the selected one in browser.
alias om="GH_FORCE_TTY=100% gh issue list -R $CLI_ISSUES -L 1000 --search 'assignee:@me' | fzf --ansi --preview 'GH_FORCE_TTY=100% gh issue -R $CLI_ISSUES view {1}' --preview-window down --header-lines 3 | cut -d' ' -f1 | tr -d '#' | xargs gh issue -R $CLI_ISSUES view -w"

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
            GH_FORCE_TTY=100% gh pr list --search $@ | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | cut -d' ' -f1 | tr -d '#' | xargs gh pr view -w
        else
            echo "Filter arguments are required."
        fi
    else
        echo "gh is not installed"
    fi
}

# Clipboard
xc() {
    if [ $(uname) = "Darwin" ]; then
        pbcopy
    else
        xclip -selection clipboard
    fi
}

# Clear git alias for gm bin to work
unalias gm
alias gm="~/.gm/bin/gm"
