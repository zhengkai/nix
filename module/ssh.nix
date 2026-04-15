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
    openssh.authorizedKeys.keyFiles = [
      ../key/zhengkai.pub
    ];
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
}
