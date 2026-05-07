{ config, pkgs, ... }:

# memoria 的 sass-embedded 不兼容 nixos，需要手动 patch
#
# autoPatchelf node_modules/sass-embedded*

{
  services.nginx.virtualHosts."memoria.anna.9farm.com" = {
    forceSSL = true;
    sslCertificate = "/repo/cert/anna.9farm.com.crt";
    sslCertificateKey = "/repo/cert/anna.9farm.com.key";
    listen = [
      { addr = "[::]"; port = 80; }
      { addr = "[::]"; port = 443; ssl = true; }
    ];
    # extraConfig = ''
    #   access_log /log/memoria/access.log;
    #   error_log  /log/memoria/error.log;
    # '';

    locations."/api" = {
      proxyPass = "http://127.0.0.1:22709";
    };

    locations."/file" = {
      proxyPass = "http://127.0.0.1:22709";
    };
    locations."/public/" = {
      proxyPass = "http://127.0.0.1:22709/";
      extraConfig = ''
        proxy_set_header X-Forwarded-Proto https;
      '';
    };

    locations."/node_modules/.vite/deps" = {
      proxyPass = "http://127.0.0.1:22708";
    };

    locations."/" = {
      proxyPass = "http://127.0.0.1:22708";
      proxyWebsockets = true;
      extraConfig = ''
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_read_timeout 86400s;
        proxy_send_timeout 86400s;
      '';
    };

    locations."= /robots.txt" = {
      extraConfig = ''
        access_log off;
        log_not_found off;
      '';
    };

    locations."= /favicon.ico" = {
      extraConfig = ''
        expires max;
        access_log off;
        log_not_found off;
      '';
    };
  };
}
