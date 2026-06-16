{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qq
    wechat
    libnotify
    xev
    foot
    nginx
    gvfs

    pulseaudio

    appimage-run

    # swaynotificationcenter

    pgadmin4-desktopmode

    mpv
    jxrlib
  ];
}
