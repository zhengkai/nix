{ config, pkgs, lib, ... }:

{
  options.soulogic.desktop.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };
}
