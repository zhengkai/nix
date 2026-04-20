{ config, lib, pkgs, modulesPath, ... }:

{
  boot.tmp = {
    useTmpfs = true;
    tmpfsSize = "8G";
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/174a8a33-3d94-4a51-b0fd-3efb17987db4";
      fsType = "ext4";
      options = [ "acl" "noatime" ];
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
