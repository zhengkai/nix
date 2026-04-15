{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    autojump
    cmake
    colordiff
    editorconfig-core-c
    go
    iftop
    net-tools
    nodejs
    silver-searcher
    tig
    tmux
    tree
    tree-sitter
    whois
    curl
    fd
    fzf
    git
    htop
    jq
    neovim
    php
    ripgrep
    stderred
    trash-cli
    v2ray
    vim
    wget
  ];
}
