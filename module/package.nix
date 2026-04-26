{ pkgs, nixpkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    autojump
    bash-language-server
    brotli
    btop
    colordiff
    curl
    editorconfig-core-c
    fd
    fortune
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
    net-tools
    networkmanagerapplet
    nodejs
    php
    pipx
    plocate
    protobuf
    pyright
    ripgrep
    silver-searcher
    stderred
    tig
    tmux
    trash-cli
    tree
    tty-clock
    typescript-language-server
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
