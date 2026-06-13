{ pkgs, user, ... }:

{
  systemd.services.logseq = {
    path = [ pkgs.bash pkgs.coreutils pkgs.git pkgs.openssh ];
    script = "/home/${user}/logseq/push.sh";
    serviceConfig = {
      User = user;
      Type = "oneshot";
      StandardOutput = "null";
      StandardError = "null";
    };
  };

  systemd.timers.logseq  = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* *:*:43";
      Persistent = true;
    };
  };
}
