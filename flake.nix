{
  description = "zhengkai nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
  let
    hosts = import ./host/list.nix;

    mkHost = { name, desktop ? false, cpp ? false, system ? "x86_64-linux" }:

      nixpkgs.lib.nixosSystem {

        inherit system;

        specialArgs = {
          inherit name;
          user = "zhengkai";
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [

          ./build-label.nix
          ./configuration.nix

          ./host/${name}/configuration.nix
          ./host/${name}/hardware.nix

          ./module/global.nix
          ./module/ssh.nix
          ./module/package.nix
          # ./module/unstable.nix
          ./module/dotfile.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zhengkai = {
              imports = [
                ./home/dev.nix
                ./home/home.nix
              ] ++ (if desktop then
              [
                ./home/desktop.nix
                ./home/chrome.nix
              ] else []);
            };
          }
        ]
        ++ nixpkgs.lib.optional desktop ./module/desktop.nix
        ++ nixpkgs.lib.optional cpp ./module/cpp.nix;
      };
  in
  {
    nixosConfigurations = builtins.listToAttrs (map (h: {
      name = h.name;
      value = mkHost h;
    }) hosts);
  };
}
