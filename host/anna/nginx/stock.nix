{ config, pkgs, ... }:

# stock 的 sass-embedded 不兼容 nixos，需要手动 patch
#
# autoPatchelf node_modules/sass-embedded*

{
  services.nginx.virtualHosts."stock.anna.9farm.com" = {
    forceSSL = true;
    sslCertificate = "/repo/cert/anna.9farm.com.crt";
    sslCertificateKey = "/repo/cert/anna.9farm.com.key";
    root = "/work/stock/client/public";
    listen = [
      { addr = "[::]"; port = 80; }
      { addr = "[::]"; port = 443; ssl = true; }
    ];
    extraConfig = ''
      access_log /tmp/stock-access.log;
      error_log  /tmp/stock-error.log;
    '';
    locations."/api" = {
      proxyPass = "http://127.0.0.1:22721";
      extraConfig = ''
        client_max_body_size 100M;
      '';
    };
    locations."/" = {
      proxyPass = "http://127.0.0.1:22722/";
      extraConfig = ''
        proxy_pass_request_headers on;
        proxy_http_version 1.1;
        gzip off;
        proxy_cache off;
        proxy_buffering off;
        gzip_proxied off;
        proxy_read_timeout 86400s;
        proxy_send_timeout 86400s;
        proxy_connect_timeout 75s;
        proxy_buffer_size 4096;
        proxy_request_buffering off;
        keepalive_timeout 86400s;
        send_timeout 86400s;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-Proto https;
      '';
    };

    locations."= /robots.txt" = {
      extraConfig = ''
        access_log off;
        log_not_found off;
      '';
    };

    locations."= /favicon.ico" = {
      alias = "/work/stock/client/public/favicon.ico";
      extraConfig = ''
        expires max;
        access_log off;
        log_not_found off;
      '';
    };
  };
}
