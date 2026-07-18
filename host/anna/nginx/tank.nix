{ config, pkgs, ... }:

# memoria 的 sass-embedded 不兼容 nixos，需要手动 patch
#
# autoPatchelf node_modules/sass-embedded*

{
  services.nginx.virtualHosts."tank.anna.9farm.com" = {
    forceSSL = true;
    sslCertificate = "/repo/cert/anna.9farm.com.crt";
    sslCertificateKey = "/repo/cert/anna.9farm.com.key";
    root = "/work/tank/client/dist/prod";
    listen = [
      { addr = "[::]"; port = 80; }
      { addr = "[::]"; port = 443; ssl = true; }
    ];
    extraConfig = ''
      access_log /tmp/tank-access.log;
      error_log  /tmp/tank-error.log;
    '';

    locations."/data/" = {
      alias = "/work/tank/static/data/";
    };

    locations."/ng-cli-ws" = {
      proxyPass = "http://127.0.0.1:22024";
      extraConfig = ''
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_read_timeout 3600s;
        proxy_send_timeout 3600s;
      '';
    };

    locations."/" = {
      proxyPass = "http://127.0.0.1:22024";
      proxyWebsockets = true;
      extraConfig = ''
        proxy_set_header Host $host;
        proxy_read_timeout 86400s;
        proxy_send_timeout 86400s;
      '';
    };
  };
}
