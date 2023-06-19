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

# tmux colors
export TERM=xterm-256color

export OP_MONOREPO="$HOME/dev/op/monorepo"

# -------
# ALIASES
# -------

# Optimism Dev
alias opr="z $OP_MONOREPO && yarn clean && yarn build && (z ./op-bindings && make)"
alias opc="z $OP_MONOREPO/packages/contracts-bedrock && yarn gas-snapshot && yarn storage-snapshot && yarn lint"
alias foundryup-op="foundryup -C da2392e58bb8a7fefeba46b40c4df1afad8ccd22"

# Go
alias gts="gotestsum --format=testname"

# Graphite
alias rsr="gt rs && gt sr"

# Cargo
alias stone="cargo +nightly fmt -- && cargo +nightly clippy --all --all-features -- -D warnings"
alias rock="cargo +nightly fmt"

# Neovim
alias n="nvim -i NONE"

# Misc
alias c="clear"

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
CITY="Portimao"
wttr() {
  if [ "$1" = "-v2" ]; then
    curl -L https://v2.wttr.in/$CITY
  else
    curl -L https://wttr.in/$CITY
  fi
}

# Forge
ftt() {
    if [ $# -eq 1 ]; then
        forge test -vvv --match-test $1
    elif [ $# -eq 0 ]; then
        forge test -vvv
    fi
}

ftc() {
    if [ $# -eq 1 ]; then
        forge test -vvv --match-contract $1
    elif [ $# -eq 0 ]; then
        forge test -vvv
    fi
}

# Clear git alias for gm bin to work
unalias gm
alias gm="~/.gm/bin/gm"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ben/dev/op/on-call-tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ben/dev/op/on-call-tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ben/dev/op/on-call-tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ben/dev/op/on-call-tools/google-cloud-sdk/completion.zsh.inc'; fi
