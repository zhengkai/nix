{
  description = "zhengkai nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    nixpkgs.config.allowUnfree = true;

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware.nix
        ./index.nix
		./module/system-package.nix
		./module/desktop.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.zhengkai = {
		    imports = [
              ./home/dev.nix
              ./home/home.nix
            ];
          };
        }
      ];
    };
  };
}
