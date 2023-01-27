install:
	# Install .zshrc
	cp ./.zshrc ~/.zshrc
	# Install modified oh-my-zsh theme
	cp ./robbyrussell-mod.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
	# Install tmux configs
	cp ./.tmux.conf ~/.tmux.conf
	# Remove old .tmux folder and copy ours over
	rm -rf ~/.tmux
	cp -R ./.tmux ~/
	# Install .config folders
	cp -R ./.config/* ~/.config/
	# Install "gm" config folder and build binary
	cp -R ./.gm ~/
	(cd ~/.gm/codebase && cargo build --release)
	cp ~/.gm/codebase/target/release/gm ~/.gm/bin/gm
	rm -rf ~/.gm/codebase/target
fresh-setup:
	# Install rust
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	rustup update
	rustup update +nightly
	# Install nvm (v0.39.2)
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
	# Install foundry
	curl -L https://foundry.paradigm.xyz | bash
	# Install huff
	curl -L get.huff.sh | bash
	# Install neovim
	git clone git@github.com:neovim/neovim.git ~/.config/nvim
