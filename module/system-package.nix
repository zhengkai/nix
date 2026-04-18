{ pkgs, nixpkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    autojump
    colordiff
    curl
    editorconfig-core-c
    fd
    fzf
    gcc
    git
    go
    htop
    iftop
    jq
    gnumake
    net-tools
    nodejs
    php
    pipx
    protobuf
    ripgrep
    silver-searcher
    stderred
    tig
    tmux
    trash-cli
    tree
    v2ray
    vim
    wget
    whois
    ifstat-legacy
    bash-language-server
    lua-language-server
    pyright

    neofetch

    luarocks
    lua5_1
    tree-sitter
  ];
}
