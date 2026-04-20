{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.soulogic.desktop.enable {
    fonts = {
      packages = with pkgs; [
        noto-fonts-color-emoji
        source-han-sans
        source-han-serif
        source-sans
        source-serif
        jetbrains-mono

        font-awesome
        roboto
        nerd-fonts.jetbrains-mono
      ];

      fontconfig = {
        defaultFonts = {
          serif = [
            "Source Serif 4"
            "Source Han Serif SC"
          ];
          sansSerif = [
            "Source Sans 3"
            "Source Han Sans SC"
          ];
          monospace = [
            "JetBrains Mono NL"
            "Source Han Sans SC"
          ];
          emoji = [
            "Noto Color Emoji"
          ];
        };
      };

      fontconfig.localConf = builtins.readFile ../misc/font-config.xml;
    };
  };
}
