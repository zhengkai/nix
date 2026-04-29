{ config, pkgs, ... }:

{
  services.v2ray = {
    enable = true;
    configFile = "/etc/v2ray/client-nat.json";
  };
}
