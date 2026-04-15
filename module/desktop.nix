{ config, pkgs, lib, ... }:

let
  isDesktop = config.services.xserver.enable || config.programs.hyprland.enable;
in
{
  config = lib.mkIf isDesktop {
    environment.systemPackages = with pkgs; [
      google-chrome
    ];
  };
}
