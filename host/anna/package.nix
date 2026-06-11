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

    mpv
    jxrlib
  ];
}
