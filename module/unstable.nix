{ pkgs, pkgs-unstable, ... }:

# 本文件不起作用
# 已经在 /flake.nix 里注释掉了

{
  environment.systemPackages = with pkgs; [
    # pkgs-unstable.neovim
  ];
}
