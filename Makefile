install:
	# Install .zshrc
	cp ./.zshrc ~/.zshrc
	# Install modified oh-my-zsh theme
	cp ./robbyrussell-mod.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
	# Install tmux configs
	cp ./.tmux.conf ~/.tmux.conf
	# Install .config folders
	cp -R ./.config/* ~/.config/
	# Install "gm" config folder and build binary
	cp -R ./.gm ~/
	(cd ~/.gm/codebase && cargo build --release)
	cp ~/.gm/codebase/target/release/gm ~/.gm/bin/gm
	rm -rf ~/.gm/codebase/target
