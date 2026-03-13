{ ... }:
{
  system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos";
    dates = "Sun *-*-* 04:00:00";
    allowReboot = false;
  };

  systemd.timers.nixos-upgrade = {
    timerConfig = {
      Persistent = true;
    };
  };
}
