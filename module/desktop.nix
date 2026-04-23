{ config, pkgs, lib, user, ... }:

{
  imports = [
    ./font.nix
  ];

  config = lib.mkIf config.soulogic.desktop.enable {

    services.dbus.enable = true;
    security.polkit.enable = true;

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.setPath.enable = true;
    };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "Hyprland";
          user = user;
        };
      };
    };
    security.pam.services.hyprlock.enable = false;
    services.getty.autologinUser = user;

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
      hyprshot
      slurp
      satty
      wl-clipboard    # 剪贴板
      cliphist        # 剪贴板历史
      brightnessctl   # 亮度

      imagemagick

      loupe

      # 文件管理（可选）
      nautilus
      file-roller
      unzip
      zip
      p7zip

      gparted

      adwaita-icon-theme
      hicolor-icon-theme
      gnome-themes-extra

      # 认证弹窗
      polkit_gnome

      qt6.qtwayland

      libxkbcommon
      libxcb
      xcb-util-cursor
      qt6.qtbase
    ];

    xdg.mime = {
      enable = true;
      defaultApplications = {
        "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
        "image/png" = [ "org.gnome.Loupe.desktop" ];
        "image/gif" = [ "org.gnome.Loupe.desktop" ];
        "image/webp" = [ "org.gnome.Loupe.desktop" ];
        "image/bmp" = [ "org.gnome.Loupe.desktop" ];
        "image/tiff" = [ "org.gnome.Loupe.desktop" ];
        "image/svg+xml" = [ "org.gnome.Loupe.desktop" ];
        "image/avif" = [ "org.gnome.Loupe.desktop" ];
        "image/heif" = [ "org.gnome.Loupe.desktop" ];
        "image/heic" = [ "org.gnome.Loupe.desktop" ];
        "image/x-portable-bitmap" = [ "org.gnome.Loupe.desktop" ];
        "image/x-portable-graymap" = [ "org.gnome.Loupe.desktop" ];
        "image/x-portable-pixmap" = [ "org.gnome.Loupe.desktop" ];
        "image/x-portable-anymap" = [ "org.gnome.Loupe.desktop" ];
        "image/x-xbitmap" = [ "org.gnome.Loupe.desktop" ];
        "image/x-xpixmap" = [ "org.gnome.Loupe.desktop" ];
        "image/vnd.microsoft.icon" = [ "org.gnome.Loupe.desktop" ];
        "image/x-icon" = [ "org.gnome.Loupe.desktop" ];
      };
    };
  };
}
