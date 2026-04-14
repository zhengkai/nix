{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    htop
    neovim
    ripgrep
    fd
	silver-searcher
	nodejs
	autojump
	colordiff
	cmake
	iftop
	net-tools
	tmux
	whois
	tree
	tree-sitter
	go
	tig
    php
    fzf
  ];
}
