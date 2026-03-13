{ ... }:
{
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 14d --keep-last 3";
  };

  nix.settings.auto-optimise-store = true;

  systemd.services.nix-gc = {
    requires = [ "nixos-upgrade.service" ];
    after = [ "nixos-upgrade.service" ];
  };
}
