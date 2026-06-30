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

    nix-index

    stdenv.cc.cc.lib
    clinfo
    intel-compute-runtime
    intel-gmmlib
    intel-gpu-tools
    intel-graphics-compiler
    intel-ocl
    intel-oneapi-toolkit
    level-zero
    nvtopPackages.intel

    # swaynotificationcenter

    pgadmin4-desktopmode

    mpv
    jxrlib
  ];
}
