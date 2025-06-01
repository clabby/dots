# Default recipe
ls:
  just --list

_prompt name='':
  #!/bin/bash
  read -p "Installing {{name}}. Do you want to proceed? (yes/no) " yn

  case $yn in
    yes ) echo "Installing..";;
    no ) echo "Exiting...";
            exit 1;;
    * ) echo "Invalid response";
            exit 1;;
  esac

# Install everything
install-all: zshrc starship tmux ghostty nvim

# Install the `.zshrc`
zshrc: (_prompt 'zshrc')
  cp ./.zshrc ~/.zshrc

# Install the starship configuration
starship: (_prompt 'starship config')
  cp ./config/starship.toml ~/.config/starship.toml

# Install the tmux configuration
tmux: (_prompt 'tmux config')
  cp ./.tmux.conf ~/.tmux.conf

# Install the ghostty configuration
ghostty: (_prompt 'ghostty config')
  cp -R ./config/ghostty/ ~/.config

# Install the nvim configuration
nvim: (_prompt 'nvim config')
  rm -rf ~/.config/nvim
  cp -R ./config/nvim ~/.config
