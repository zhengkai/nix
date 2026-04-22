{ config, pkgs, ... }:

{
  services.gvfs.enable = true;

  environment.systemPackages = with pkgs; [
    samba
    glib
  ];

  environment.sessionVariables = {
    GIO_EXTRA_MODULES = [ "${pkgs.gvfs}/lib/gio/modules" ];
  };

  services.samba = {
    enable = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
