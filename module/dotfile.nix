{ pkgs, ... }:

{
  system.activationScripts.cloneDotfile.text = ''
    export USER="zhengkai"

    run_clone() {
      REPO_URL="$1"
      TARGET_DIR="/home/$USER/$2"
      BRANCH="$3"

      echo "$REPO_URL"

      if [ ! -d "$TARGET_DIR" ]; then
        ${pkgs.sudo}/bin/sudo -u "$USER" GIT_CONFIG_GLOBAL=/dev/null ${pkgs.git}/bin/git clone  \
          --depth=1 \
          --branch="$BRANCH" \
          "$REPO_URL" \
          "$TARGET_DIR" &>/dev/null || :
      fi
    }

    mkdir -p "/home/zhengkai/foo"

    run_clone \
      "https://github.com/zhengkai/nvim.git" \
      ".config/nvim" \
      "master"

    run_clone \
      "https://github.com/folke/lazy.nvim.git" \
      ".local/share/nvim/lazy/lazy.nvim" \
      "stable"
  '';
}
