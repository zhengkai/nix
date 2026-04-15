{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs-unstable.neovim
    pkgs-unstable.luarocks
    pkgs-unstable.lua5_1
    pkgs-unstable.lua51Packages.tree-sitter-cli
  ];
}
