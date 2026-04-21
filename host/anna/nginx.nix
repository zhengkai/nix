{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nginx
  ];

  users.users.www-data = {
    isSystemUser = true;
    group = "www-data";
  };
  users.groups.www-data = {};

  services.nginx = {
    enable = true;
    user = "www-data";
    group = "www-data";

    # 将配置根目录指向 /etc/nginx
    appendConfig = ''
      # 你的全局配置
    '';

    virtualHosts."example.com" = {
      root = "/www/example.com";
      listen = [{ addr = "0.0.0.0"; port = 80; }];
      locations."/" = {
        index = "index.html";
      };
    };
  };

  # 开放防火墙端口
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
