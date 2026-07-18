{ config, pkgs, ... }:

{

  imports = [
    ./memoria.nix
    # ./tank.nix
    ./stock.nix
  ];

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

    virtualHosts."anna.9farm.com" = {
      addSSL = true;
      sslCertificate = "/repo/cert/anna.9farm.com.crt";
      sslCertificateKey = "/repo/cert/anna.9farm.com.key";
      listen = [
        { addr = "[::]"; port = 80; extraParameters = [ "default_server" "ipv6only=off" ]; }
        { addr = "[::]"; port = 443; ssl = true; extraParameters = [ "default_server" "ipv6only=off" ]; }
      ];
      locations."/pac/" = {
        alias = "/work/pac/output/";
        extraConfig = ''
          autoindex on;
          access_log off;
          log_not_found off;
        '';
      };
      locations."/" = {
        extraConfig = ''
          default_type text/plain;
          return 200 "Anna $remote_addr";
        '';
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
