{ config, pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;          # Win11 必须：TPM 2.0 模拟
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;
  programs.dconf.enable = true;
  security.polkit.enable = true;

  users.users.zhengkai.extraGroups = [ "libvirtd" "kvm" "input" "www-data" ];

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    qemu_kvm
    spice-gtk
    virtio-win         # Windows virtio 驱动 ISO
    polkit_gnome
    looking-glass-client
  ];

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
