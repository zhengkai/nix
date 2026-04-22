{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qq
    libnotify
    xev
    foot
    nginx
    gvfs

    vlc
    jxrlib
  ];
}
