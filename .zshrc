# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# THEME
ZSH_THEME="robbyrussell"

# Arch or Mac
IS_DARWIN=false

# PLUGINS
plugins=(git)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ------------------
# User configuration
# ------------------

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Node version manager
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
export OP_RPC=https://opt-mainnet.g.alchemy.com/v2/vH5TkOpQNJmiQgA0OUa83SpCP0kNVOAr
export ETH_ANTON=http://anton.clab.by:8545

# tmux colors
export TERM=xterm-256color

export OP_MONOREPO="$HOME/dev/op/monorepo"

# -------
# ALIASES
# -------

# Optimism Dev
alias oprefresh="z $OP_MONOREPO && nx reset && p clean && p build"
alias opr="z $OP_MONOREPO/packages/contracts-bedrock && p gas-snapshot && p semver-lock && p lint && p storage-snapshot && forge clean && (z $OP_MONOREPO/op-bindings && make)"
alias foundryup-op="foundryup -C $(cat $OP_MONOREPO/.foundryrc)"

# Go
alias gts="gotestsum --format=testname"

# Graphite
alias rsr="gt rs && gt sr"

# Cargo
alias cg="cargo"
alias stone="cargo +nightly fmt -- && cargo +nightly clippy --all --all-features -- -D warnings"
alias rock="cargo +nightly fmt"

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
    if [ "$1" = "anton" ]; then
        export ETH_RPC_URL=$ETH_ANTON
    elif [ "$1" = "eth" ]; then
        export ETH_RPC_URL=$ETH_RPC
    elif [ "$1" = "op" ]; then
        export ETH_RPC_URL=$OP_RPC
    else
        export ETH_RPC_URL=""
    fi
}

# Clear git alias for gm bin to work
unalias gm
alias gm="~/.gm/bin/gm"

# pnpm
export PNPM_HOME="/Users/ben/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
