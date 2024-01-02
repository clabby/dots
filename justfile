# Install everything
install-all: zshrc omz-theme tmux-conf alacritty nvim lazygit-themes gm

# Install the `.zshrc` config
zshrc:
  cp ./.zshrc ~/.zshrc

# Install the modified oh-my-zsh theme
omz-theme:
  cp ./robbyrussell-mod.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme

# Install the tmux configuration
tmux-conf:
  cp ./.tmux.conf ~/.tmux.conf

# Install the alacritty configuration
alacritty:
  cp -R ./config/alacritty ~/.config

# Install the nvim configuration
nvim:
  cp -R ./config/nvim ~/.config

# Install lazygit themes
lazygit-themes:
  cp -R ./config/lazygit ~/.config

# Install gm
gm:
  mkdir -p ~/.gm
  cp -R ./gm ~/.gm
  (cd ~/.gm/codebase && cargo build --release)
  cp ~/.gm/codebase/target/release/gm ~/.gm/bin/gm
  rm -rf ~/.gm/codebase/target
