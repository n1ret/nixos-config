{ pkgs, ... }:

{
  security.polkit = {
    enable = true;
    extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.policykit.exec"
          && action.lookup("command_line") == "/run/current-system/sw/bin/bash /home/"+subject.user+"/.config/nekoray/config/vpn-run-root.sh"
          && subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });
    '';
  };

  environment.systemPackages = [ pkgs.polkit_gnome ];
  systemd = {
    user.services.polkit-auth-agent = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
