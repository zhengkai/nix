{ pkgs, name, user, ... }:

let
  script = builtins.readFile ../script/dotfile.sh;
in
{
  system.activationScripts.cloneDotfile.text = ''
    export USER="${user}"
    export SUDO="${pkgs.sudo}/bin/sudo"
    export GIT="${pkgs.git}/bin/git"
    export UHOME="/home/${user}"

    ${script}
  '';
}
