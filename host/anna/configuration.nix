{ config, pkgs, user, ... }:

{

  imports = [
    ./kvm.nix
    ./v2ray.nix
    ./package.nix
    ./nginx/index.nix
    ./samba.nix
    ./pgsql.nix
    ./crontab/logseq.nix
  ];

  programs.steam.enable = true;

  boot.loader.timeout = 3;

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 20;
    extraEntries = {
      "windows.conf" = ''
        title Windows 11
        efi /EFI/Microsoft/Boot/bootmgfw.efi
        sort-key a-windows
        '';
    };
    editor = false;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # common

  services.displayManager = {
    enable = true;
    autoLogin.enable = true;
    autoLogin.user = user;
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
