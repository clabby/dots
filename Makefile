.PHONY: install push

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

push:
	cp ~/.zshrc ./.zshrc
	cp ~/.tmux.conf ./.tmux.conf
	cp ~/.alacritty.yml ./.alacritty.yml
	cp -R ~/.tmux ./.tmux
	cp -R ~/.gm ./.gm
	# Push to github as a new update branch
	git checkout -b update/$$(date +%Y-%m-%d)
	git add .
	git commit -m "automated dot updates :camera_flash:"
	git push
