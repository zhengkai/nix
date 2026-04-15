{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      source-han-sans
      source-han-serif
      source-sans
      source-serif
      jetbrains-mono
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Source Han Serif" "Noto Serif CJK SC" ];
        sansSerif = [ "Source Han Sans" "Noto Sans CJK SC" ];
        monospace = [ "Noto Sans Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
