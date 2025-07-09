#!/bin/bash

# install homebrew

function install_homebrew() {
	echo "Checking for Homebrew..."
	# Check if Homebrew is installed
	if ! command -v brew &>/dev/null; then
		echo "Homebrew not found. Installing..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	else
		echo "Homebrew already installed."
	fi
}

# install packages
function install_packages() {
	# Update Homebrew
	echo "Updating Homebrew..."
	brew update
	brew upgrade
	brew cleanup

	echo "Installing packages..."
	packages=(
		git
		bat
		lolcat
		black
		httpie
		localtunnel
		pwgen
		lua
		helm
		httping
		tcping
		pstree
		duf
		python
		speedtest-cli
		tcping
		socat
		lsd
		ansible
		shellcheck
		k3d
		node
		python3
		wget
		curl
		kubecolor
		zsh
		vim
		uv
		golang
		tree
		htop
		jq
		yq
		shfmt
		telnet
		nmap
		make
		awscli
		terraform
		docker
		kubernetes-cli
	)
	for package in "${packages[@]}"; do
		if brew list "$package" && ! which "$package" &>/dev/null; then
			echo "$package is already installed."
		else
			echo "Installing $package..."
			echo "Installing $package..."
			brew install "$package"
		fi
	done
}

# install oh-my-zsh
function install_oh_my_zsh() {
	echo "Installing oh-my-zsh..."
	if [ -d "$HOME/.oh-my-zsh" ]; then
		echo "oh-my-zsh is already installed."
	else
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi

}

# install cask packages
function install_cask_packages() {
	echo "Installing cask packages..."
	cask_packages=(
		google-chrome
		visual-studio-code
		iterm2
		chatgpt
		orbstack
		sublime-text
		font-hack-nerd-font
		claude
		hammerspoon
		trae
		slack
		hyper
		iterm2
		drawio
		lark
		dbeaver-community
		hoppscotch
		lens
		snipaste
		miniconda
	)
	for package in "${cask_packages[@]}"; do
		if brew list --cask "$package" &>/dev/null; then
			echo "$package is already installed."
		else
			echo "Installing $package..."
			brew install --cask "$package"
		fi
	done
}

# create ssh keys
function create_ssh_keys() {
	echo "Creating SSH keys..."
	if [ ! -f "$HOME/.ssh/id_rsa" ]; then
		echo "Generating SSH keys..."
		mkdir -p "$HOME/.ssh"
		chmod 700 "$HOME/.ssh"
		echo "run those commands in your terminal:

        ssh-keygen -t ed25519 -b 4096 -C \"$(whoami)@$(hostname)\"

        "
	else
		echo "SSH keys already exist."
	fi
}

# create ssh config file
function create_ssh_config() {
	echo "Creating SSH config file..."
	if [ ! -f "$HOME/.ssh/config" ]; then
		cp config "$HOME/.ssh/config"
		mkdir -p "$HOME/.ssh/config.d"
		cp -rf config.d "$HOME/.ssh/"
	fi
}

# download_binaries
function download_binaries() {
	echo "Downloading binaries..."
	mkdir -p "$HOME/bin"

}

# aliases
function create_aliases() {
	echo "Creating aliases..."
	cp -rf zsh "$HOME/.zsh"
	source "$HOME/.zsh/basic.sh"
	echo "Aliases created."
}

# git config
function setup_git_config() {
	echo "Setting up git config..."
	if [ ! -f "$HOME/.gitconfig" ]; then
		cp gitconfig "$HOME/.gitconfig"
		echo "Git config created."
	else
		echo "Git config already exists."
	fi
}
# zshrc
function setup_zshrc() {
	echo "Setting up zshrc..."
	if [ ! -f "$HOME/.zshrc" ]; then
		cp "$HOME/.zshrc" "$HOME/.zshrc.bak"
		cp zshrc "$HOME/.zshrc"
		echo "Zsh config created."
	fi
}

# run the script
echo "Starting setup..."

install_homebrew
install_packages
install_oh_my_zsh
install_cask_package
create_ssh_keys
create_aliases
setup_zshrc

echo "Setup completed successfully!"
echo "Please restart your terminal or run 'source ~/.zshrc' to apply changes."
