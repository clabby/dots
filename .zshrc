# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# THEME
ZSH_THEME="robbyrussell"

# PLUGINS
plugins=(git)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ------------------
# User configuration
# ------------------

# Set manpath
export MANPATH="/usr/local/man:$MANPATH"

# Add local bins to path
export PATH="$PATH:$HOME/.foundry/bin"
export PATH="$PATH:$HOME/.huff/bin"
export PATH="$PATH:$HOME/.local/bin"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# -------
# ENV
# -------

export ETH_RPC=https://eth-mainnet.g.alchemy.com/v2/Y2SGiriVdroLNFmXB6TzCAOTV4RPbotK
export OP_RPC=https://opt-mainnet.g.alchemy.com/v2/vH5TkOpQNJmiQgA0OUa83SpCP0kNVOAr

# -------
# ALIASES
# -------

# Cargo
alias stone="cargo +nightly fmt -- && cargo +nightly clippy --all --all-features -- -D warnings"
alias rock="cargo +nightly fmt"

# Neovim
alias n="nvim"

# Cat
alias cat="bat"

# Exa aliases
alias ls="exa"
alias la="exa -lah"
alias ll="exa -lh"
alias lt="exa -lhT -L 2"

# Clear git alias for gm bin to work
unalias gm
alias gm="~/.gm/bin/gm"

# ----
# MISC
# ----

# tmux colors
export TERM=xterm-256color
