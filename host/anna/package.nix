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

    mpv
    jxrlib
  ];
}
