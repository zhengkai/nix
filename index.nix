{ config, pkgs, ... }:

{

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PermitRootLogin = "no";       
      PasswordAuthentication = false;
    };
  };
  networking.firewall.allowedTCPPorts = [ 22 ];
  
  users.users.zhengkai = {
    isNormalUser = true;
    shell = pkgs.zsh;
    openssh.authorizedKeys.keyFiles = [ 
      "ecdsa-sha2-nistp384 AAAAE2VjZHNhLXNoYTItbmlzdHAzODQAAAAIbmlzdHAzODQAAABhBP2xja829lf7++HY2yxduXvQDSdHX7Qe2bo/o4BiWg1ol7xwF+lbMs2GTIwhfUHAfBX+iwhaoLyLT23SUls2IWEwyBpoetahf2RzZRWf9jftWX+jVRs5sHW0ZcQpCVJbCw== zhengkai@AnnaNix"
    ];
  };

  programs.zsh.enable = true;
  
  security.sudo.extraRules = [
    {
      users = [ "zhengkai" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
