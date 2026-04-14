{
  description = "zhengkai nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix

        # 软件包和额外配置写在这里
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
