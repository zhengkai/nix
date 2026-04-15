{ pkgs, ... }:

{
  home.stateVersion = "25.11";

  home.username = "zhengkai";
  home.homeDirectory = "/home/zhengkai";

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/conf/bin"
    "$HOME/go/bin"
  ];

  home.sessionVariables = {
    GOPATH = "${config.home.homeDirectory}/app/go";
    GOMODCACHE = "${config.home.homeDirectory}/app/go/pkg/mod";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/app/go/bin"
  ];

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
