{ pkgs, ... }:

{
  services.gnome.gnome-keyring.enable = true;
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

    libsecret

    libx11
    libxext
    libxfixes
    libxrandr

    # swaynotificationcenter

    pgadmin4-desktopmode

    mpv
    jxrlib
  ];
}
