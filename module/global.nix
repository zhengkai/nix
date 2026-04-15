{ config, pkgs, lib, ... }:

{
  options.soulogic.desktop.enable = lib.mkOption {
    type = lib.types.bool;
    default = config.services.xserver.enable
      || config.programs.hyprland.enable;
  };
}
