{ lib, config, ... }:
{
  options.profiles.plasma.enable = lib.mkEnableOption "KDE Plasma 6 desktop";

  config = lib.mkIf config.profiles.plasma.enable {
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "amdgpu" ];
    services.xserver.xkb.layout = "de";

    services.desktopManager.plasma6.enable = true;
  };
}
