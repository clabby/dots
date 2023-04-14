# path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

eval "$(zoxide init zsh)"

# see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Arch or Mac
IS_DARWIN=false

# PLUGINS
plugins=(git)

plugins=(
  git
  bundler
  dotenv
  zsh-autosuggestions
  rake
  zsh-syntax-highlighting
  rbenv
  ruby
  npm
)

PROMPT_EOL_MARK=''

source $ZSH/oh-my-zsh.sh

export GITHUB_TOKEN=""
alias center="^+⌥+e && ^+⌥+c"

alias gochecks="gosec -fmt=json -out=results.json ./..."
alias whatsmyip="dig +short txt ch whoami.cloudflare @1.0.0.1"

alias octane="sshpass -f <(printf '%s\n' $OCTANE_PASSWORD) ssh andreas@68.104.25.122"
alias whitenoise="sshpass -f <(printf '%s\n' $WHITENOISE_PASSWORD) ssh andreas@71.105.135.50"
alias cain="ssh -i \"~/.ssh/cain.pem\" ubuntu@ec2-3-95-33-182.compute-1.amazonaws.com"

# Optimism Tailscale K8s
alias op-dev-connect="gcloud container clusters get-credentials oplabs-dev-client-primary --region us-central1 --project oplabs-dev-client"
alias op-dev-ctx="kubie ctx"

# Optimism Nodes
alias opnode-goerli="wscat -c ws://71.105.135.50:9992"
alias opnode-mainnet="wscat -c ws://68.104.25.122:9992"
alias opnode-goerli-js="geth attach http://71.105.135.50:9991"
alias opnode-mainnet-js="geth attach http://68.104.25.122:9991"
alias og="gcloud auth login --update-adc"

# export GOROOT="/usr/local/Cellar/go/1.16.6/libexec"
export GOROOT=""
export GOPATH="/Users/Shared/Development/go-workspace"
export PATH="$PATH:$GOPATH/bin"

# github pat
export PERSONAL_ACCESS_TOKEN="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"

# rust bin configs
export PATH="$PATH:/Users/andreasbigger/.foundry/bin"
export PATH="$PATH:/Users/andreasbigger/.huff/bin"
export PATH="$PATH:$(yarn global bin)"

# Python sourcing
export PATH="$PATH:/Users/andreasbigger/Library/Python/3.9/bin"
export PATH="$PATH:/opt/homebrew/bin"

# rust stuff
export CARGO_NET_GIT_FETCH_WITH_CLI=true

# android
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/platform-tools
#
# aliases
alias gm=/usr/local/bin/gm
alias s="source ~/.zshrc"
alias gb="git-branchless"
alias dc="docker-compose"
alias kx="kubectx"
alias k="kubectl"
alias python=/usr/bin/python3
alias spark="cargo +nightly fmt --all"
alias sleep="pmset sleepnow"
alias flint="cargo check --all && cargo +nightly fmt -- --check && cargo +nightly clippy --all --all-features -- -D warnings && cargo test --all --all-features"
alias rock='spark && flint'
alias eagle="cargo test -- --show-output"
alias c="code ."
alias g="gt"

 # Nix
 # if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
 #    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
 # fi
 # End Nix

 # nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ruby
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:/Users/andreasbigger/.archon/bin"
export PATH="$PATH:/Users/andreasbigger/.arch/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/andreasbigger/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/andreasbigger/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/andreasbigger/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/andreasbigger/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<



# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/andreasbigger/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/andreasbigger/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/andreasbigger/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/andreasbigger/google-cloud-sdk/completion.zsh.inc'; fi

# [[ -s "/Users/andreasbigger/.gvm/scripts/gvm" ]] && source "/Users/andreasbigger/.gvm/scripts/gvm"
#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: gt completion >> ~/.zshrc
#    or gt completion >> ~/.zprofile on OSX.
#
# _gt_yargs_completions()
# {
#   local reply
#   local si=$IFS
#   IFS=$'
# ' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
#   IFS=$si
#   _describe 'values' reply
# }
# compdef _gt_yargs_completions gt
###-end-gt-completions-###


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
alias foundryup-op="foundryup -C 2ff99025abade470a795724c10648c800a41025e"

# Go
alias gts="gotestsum --format=testname"

# Graphite
alias rsr="gt rs && gt sr"

# Cargo
alias stone="cargo +nightly fmt -- && cargo +nightly clippy --all --all-features -- -D warnings"
alias rock="cargo +nightly fmt"

# Neovim
alias n="nvim"

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
