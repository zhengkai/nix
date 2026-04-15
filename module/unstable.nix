{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs-unstable.neovim
    pkgs-unstable.tree-sitter
  ];
}
