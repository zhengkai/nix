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

    environment.systemPackages = with pkgs; [
      wezterm
      google-chrome

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
      # thunar

      # 认证弹窗
      polkit_gnome
    ];
  };
}
