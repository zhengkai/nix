{ config, pkgs, ... }:

{

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PermitRootLogin = "no";            # 禁止 root 登录（推荐）
      PasswordAuthentication = true;      # 允许密码登录
    };
  };
  networking.firewall.allowedTCPPorts = [ 22 ];

  environment.systemPackages = with pkgs; [
  	curl
	wget
	git
	htop
	fd
	neovim
  ];
}
