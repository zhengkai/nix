{ config, lib, ... }:

let
  devPath = "${config.home.homeDirectory}/dev";
in
{
  options.soulogic.dev = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    default = {};
  };

  config.soulogic.dev = {
    path = devPath;
    goPath = "${devPath}/go";
    pipxPath = "${devPath}/pipx";
  };
}
