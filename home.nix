{ pkgs, ... }:

{
  home.stateVersion = "25.11";

  home.username = "zhengkai";
  home.homeDirectory = "/home/zhengkai";

  home.sessionPath = [
    "$HOME/conf/bin"
  ];

  programs.autojump.enable = true;

  programs.zsh = {
    enable = true;
    initContent = ''
      source ~/conf/zsh/index.zsh
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.fzf}/share/fzf/completion.zsh
      bindkey '^P' fzf-file-widget

      source ${pkgs.autojump}/share/autojump/autojump.zsh
      export LD_PRELOAD=${pkgs.stderred}/lib/libstderred.so
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
