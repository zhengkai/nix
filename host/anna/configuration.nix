{ config, pkgs, user, ... }:

{

  imports = [
    ./kvm.nix
    ./v2ray.nix
    ./package.nix
    ./nginx/index.nix
    ./samba.nix
  ];

  boot.loader.timeout = 3;

  # Bootloader.
  #  boot.loader.grub = {
  #    enable = true;
  #    device = "/dev/vda";
  #    useOSProber = true;
  #  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.sortKey = "z-nixos"; # 让 win11 排在前面

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
