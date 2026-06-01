{ pkgs, nixpkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    aegisub
    asciidoctor
    autoPatchelfHook
    autojump
    bash-language-server
    bc
    brotli
    btop
    cmark
    cmark-gfm
    colordiff
    curl
    editorconfig-core-c
    fd
    ffmpeg
    fortune
    fzf
    gcc
    geoip
    git
    gnumake
    go
    htop
    ifstat-legacy
    iftop
    inetutils
    iperf3
    jq
    libmaxminddb
    libsecret.dev
    lm_sensors
    lsb-release
    lsof
    lua-language-server
    mkvtoolnix
    neovim
    net-tools
    networkmanagerapplet
    nmap
    nodejs
    npm-check-updates
    # pipx
    plocate
    protobuf
    psmisc
    pwgen
    pyright
    python3
    ripgrep
    silver-searcher
    socat
    stderred
    tig
    tmux
    trash-cli
    tree
    tty-clock
    typescript-language-server
    unzip
    usbutils
    v2ray
    v2ray-domain-list-community
    v2ray-geoip
    vim
    wget
    whois
    zip

    luarocks
    lua5_1
    tree-sitter

    yazi

    (php.buildEnv {
      extraConfig = ''
      date.timezone = Asia/Shanghai
      '';
    })
  ];
}
