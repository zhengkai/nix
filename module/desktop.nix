{ config, pkgs, lib, ... }:

{
  imports = [
    ./font.nix
  ];

  config = lib.mkIf config.soulogic.desktop.enable {

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "Hyprland";
          user = "zhengkai";
        };
      };
    };
    security.pam.services.hyprlock.enable = false;
    services.getty.autologinUser = "zhengkai";

    systemd.targets.sleep.enable = false;
    systemd.targets.suspend.enable = false;
    systemd.targets.hibernate.enable = false;
    systemd.targets.hybrid-sleep.enable = false;

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    environment.sessionVariables = {
      XMODIFIERS = "@im=fcitx";
    };

    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          qt6Packages.fcitx5-chinese-addons
          fcitx5-gtk               # GTK 应用支持
          kdePackages.fcitx5-qt
          fcitx5-pinyin-zhwiki
        ];
      };
    };

    environment.systemPackages = with pkgs; [
      wezterm
      google-chrome

      wl-clipboard
      xclip

      # Hyprland 生态
      waybar          # 状态栏
      wofi            # 启动器
      hyprpaper       # 壁纸
      mako            # 通知
      hyprlock        # 锁屏
      hypridle        # 空闲管理

      # 工具
      grim            # 截图
      wl-clipboard    # 剪贴板
      cliphist        # 剪贴板历史
      brightnessctl   # 亮度

      # 文件管理（可选）
      xfce.thunar
      nautilus

      # 认证弹窗
      polkit_gnome

      qt6.qtwayland

      libxkbcommon
      xorg.libxcb
      xcb-util-cursor
      qt6.qtbase
    ];
  };
}
