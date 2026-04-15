{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";

  home.username = "zhengkai";
  home.homeDirectory = "/home/zhengkai";

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/conf/bin"
    "${config.soulogic.dev.goBinPath}"
  ];

  home.sessionVariables = {
    GOPATH = config.soulogic.dev.goBinPath;
    GOMODCACHE = config.soulogic.dev.goModPath;
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
      bindkey '^P' fzf-file-widget
    '';
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "Zheng Kai";
      email = "zhengkai@gmail.com";
    };
  };

  programs.neovim.enable = true;
}
