{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  	curl
	wget
	git
	htop
	fd
	neovim
  ];
}
