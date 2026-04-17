{ config, pkgs, ... }:

{

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  services.xserver.videoDrivers = [ "qxl" ];

  # boot.loader.timeout = 3;

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
    useOSProber = false;
  };

  networking.hostName = "nixos"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    spice-vdagent
  ];

  # common

  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowSuspendThenHibernate=no
    AllowHybridSleep=no
  '';

  services.displayManager = {
    enable = true;
    autoLogin.enable = true;
    autoLogin.user = "zhengkai";
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
