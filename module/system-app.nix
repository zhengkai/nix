{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    htop
    ripgrep
    fd
  ];
}
