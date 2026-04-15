{ config, lib, ... }:

let
  devPath = "${config.home.homeDirectory}/dev";
  goPath = "${devPath}/go";
in
{
  options.soulogic.dev = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    default = {};
  };

  config.soulogic.dev = {
    goPath = goPath;
  };
}
