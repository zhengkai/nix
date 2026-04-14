{ pkgs, ... }:

{
  home.stateVersion = "25.11";

  home.sessionPath = [ "$HOME/conf/bin" ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "Zheng Kai";
      email = "zhengkai@gmail.com";
    };
  };

  programs.neovim.enable = true;
}
