{
  description = "zhengkai nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware.nix
        ./index.nix
        home-manager.nixosModules.home-manager

        ({ pkgs, ... }: {
          environment.systemPackages = with pkgs; [
            git
            neovim
            wget
            curl
            htop
          ];
        })
      ];
    };
  };
}
