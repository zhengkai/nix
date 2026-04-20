{ pkgs, nixpkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    autojump
    bash-language-server
    colordiff
    curl
    editorconfig-core-c
    fd
    fzf
    gcc
    git
    gnumake
    go
    htop
    ifstat-legacy
    iftop
    jq
    lsb-release
    lua-language-server
    neofetch
    net-tools
    networkmanagerapplet
    nodejs
    php
    pipx
    protobuf
    pyright
    ripgrep
    silver-searcher
    stderred
    tig
    tmux
    trash-cli
    tree
    unzip
    v2ray
    vim
    wget
    whois
    zip

    luarocks
    lua5_1
    tree-sitter

    yazi
  ];
}
