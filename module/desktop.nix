{ config, pkgs, lib, ... }:

{
  imports = [
    ./font.nix
  ];

  config = lib.mkIf config.soulogic.desktop.enable {
    environment.systemPackages = with pkgs; [
      wezterm
      google-chrome
    ];
  };
}
