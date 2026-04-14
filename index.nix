{ config, pkgs, ... }:

{

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PermitRootLogin = "no";       
      PasswordAuthentication = false;
    };
  };
  networking.firewall.allowedTCPPorts = [ 22 ];
  
  users.users.zhengkai = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  
  security.sudo.extraRules = [
    {
      users = [ "zhengkai" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  environment.systemPackages = with pkgs; [
  	curl
	wget
	git
	htop
	fd
	neovim
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
  ];
}
