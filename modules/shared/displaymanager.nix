{ ... }:
{
  systemd.services.display-manager.restartIfChanged = false;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
