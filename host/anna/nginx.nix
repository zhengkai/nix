{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nginx
  ];

  users.groups.nginx = {};
  users.groups.log = {};

  users.users.nginx = {
    isSystemUser = true;
    group = "nginx";
    extraGroups = [ "log" ];
  };

  services.nginx = {
    enable = true;
    user = "nginx";
    group = "nginx";

# 将配置根目录指向 /etc/nginx
# appendConfig = ''
# include /work/memoria/nginx/dev.conf;
# '';

    virtualHosts."anna.9farm.com" = {
      addSSL = true;
      sslCertificate = "/repo/cert/anna.9farm.com.crt";
      sslCertificateKey = "/repo/cert/anna.9farm.com.key";
      listen = [
      { addr = "[::]"; port = 80; extraParameters = [ "default_server" "ipv6only=off" ]; }
      { addr = "[::]"; port = 443; ssl = true; extraParameters = [ "default_server" "ipv6only=off" ]; }
      ];
      locations."/" = {
        extraConfig = ''
          default_type text/plain;
          return 200 "Anna $remote_addr";
        '';
      };
    };
  };

# 开放防火墙端口
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
