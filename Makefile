install:
	# Install .zshrc
	cp ./.zshrc ~/.zshrc
	# Install tmux configs
	cp ./.tmux.conf ~/.tmux.conf
	# Remove old .tmux folder and copy ours over
	rm -rf ~/.tmux
	cp -R ./.tmux ~/
	# Install .config folders
	cp -R ./.config/* ~/.config/
	# Install "gm" config folder
	cp -R ./.gm ~/
