{ pkgs, ... }:

{
  systemd.user.services.graceful-chrome-shutdown = {
    Unit = {
      Description = "Gracefully close Chrome/Chromium on shutdown";
      DefaultDependencies = false;
      Before = [
        "shutdown.target"
        "reboot.target"
        "halt.target"
      ];
      Conflicts = [
        "shutdown.target"
        "reboot.target"
        "halt.target"
      ];
    };

    Service = {
      Type = "oneshot";
      RemainAfterExit = true;

      # 启动时什么都不做
      ExecStart = "${pkgs.coreutils}/bin/true";

      # 关机时优雅终止 Chrome
      ExecStop = let
        stopScript = pkgs.writeShellScript "graceful-chrome-stop" ''
          export PATH="${pkgs.lib.makeBinPath [ pkgs.procps pkgs.coreutils ]}"

          echo "Sending SIGTERM to Chrome/Chromium..."

          (


          # 向 chrome/chromium 发送 SIGTERM
          pkill -TERM -f "(chrome|chromium)" 2>/dev/null || {
            echo "No Chrome/Chromium process found, nothing to do."
            exit 0
          }

          # 最多等待 5 秒让 Chrome 优雅退出
          for i in $(seq 1 50); do
            if ! pgrep -f "(chrome|chromium)" > /dev/null 2>&1; then
              echo "Chrome/Chromium exited gracefully."
              exit 0
            fi
            sleep 0.1
          done

          echo "Chrome/Chromium still running after timeout, force killing..."
          pkill -KILL -f "(chrome|chromium)" 2>/dev/null || true

          ) >/log/chrome.txt
        '';
      in toString stopScript;

      TimeoutStopSec = 10;
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
