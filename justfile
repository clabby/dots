# Install everything
install-all: zshrc tmux-conf alacritty nvim lazygit-themes

# Install the `.zshrc` + starship config
zshrc:
  cp ./config/starship.toml ~/.config/starship.toml
  cp ./.zshrc ~/.zshrc

# Install the tmux configuration
tmux-conf:
  cp ./.tmux.conf ~/.tmux.conf

# Install the alacritty configuration
alacritty:
  cp -R ./config/alacritty ~/.config

# Install the nvim configuration
nvim:
  rm -rf ~/.config/nvim
  cp -R ./config/nvim ~/.config
