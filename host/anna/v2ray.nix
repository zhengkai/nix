{ config, pkgs, ... }:

{
  # 启用 v2ray 服务
  services.v2ray = {
    enable = true;
    configFile = "/etc/v2ray/config-nat.json";
  };
}
