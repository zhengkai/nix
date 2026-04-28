{ config, pkgs,  ... }:

{
  home.stateVersion = "25.11";
  home.enableNixpkgsReleaseCheck = false;

  home.username = "zhengkai";
  home.homeDirectory = "/home/zhengkai";

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/conf/bin"
  ];

  home.sessionVariables = {
    GOPATH = config.soulogic.dev.goPath;
    GOBIN = "${config.home.homeDirectory}/.local/bin";
    PIPX_HOME = config.soulogic.dev.pipxPath;
    NPM_CONFIG_CACHE = "${config.soulogic.dev.path}/npm";
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };

  programs.autojump.enable = true;

  programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;
    enableCompletion = true;

    initContent = ''
      export LD_PRELOAD=${pkgs.stderred}/lib/libstderred.so

      source ~/conf/zsh/index.zsh
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.fzf}/share/fzf/completion.zsh
      bindkey '^P' fzf-git-widget
    '';
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "Zheng Kai";
      email = "zhengkai@gmail.com";
    };
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    download = "/share";

    desktop = "${config.home.homeDirectory}/.xdg/Desktop";
    documents = "${config.home.homeDirectory}/.xdg/Documents";
    music = "${config.home.homeDirectory}/.xdg/Music";
    pictures = "${config.home.homeDirectory}/.xdg/Pictures";
    publicShare = "${config.home.homeDirectory}/.xdg/Public";
    templates = "${config.home.homeDirectory}/.xdg/Templates";
    videos = "${config.home.homeDirectory}/.xdg/Videos";
  };
}
