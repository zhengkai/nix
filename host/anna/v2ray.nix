{ config, pkgs, ... }:

{
  # 启用 v2ray 服务
  services.v2ray = {
    enable = false;
    configFile = "/etc/v2ray/config-nat.json";
  };
}
