{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.services.xserver.enable || config.programs.hyprland.enable {
    environment.systemPackages = with pkgs; [
      source-sans
      source-serif
      jetbrains-mono
    ];
  };
}
