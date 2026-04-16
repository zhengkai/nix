{ config, pkgs, lib, ... }:

{
  imports = [
    ./font.nix
  ];

  config = lib.mkIf config.soulogic.desktop.enable {

    # programs.firefox.enable = true;

    # services.printing.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    environment.systemPackages = with pkgs; [
      wezterm
      google-chrome
    ];
  };
}
