{ config, pkgs, ... }:

{
  imports = [
    ./package.nix
  ];

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];

  # boot.loader.timeout = 3;

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
    useOSProber = false;
  };

  boot.kernelParams = [
    "clocksource=kvm-clock"
    "no_timer_check"
  ];

  networking.hostName = "nixos"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    spice-vdagent
    wl-clipboard
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
