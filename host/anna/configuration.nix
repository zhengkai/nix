{ config, pkgs, ... }:

{

  # services.qemuGuest.enable = true;
  # services.spice-vdagentd.enable = true;
  # services.xserver.videoDrivers = [ "modesetting" ];

  boot.loader.timeout = 3;

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
    useOSProber = true;
  };

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
