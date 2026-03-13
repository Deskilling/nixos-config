{ pkgs, ... }:
{
  home.packages = with pkgs; [
    librewolf
    zed-editor
    lazygit
    micro
    fzf

    nil
    nixd

    bitwarden-desktop
    bottles
    r2modman

    cider-2
    xclicker
    cemu
    haruna
    obs-studio
    prismlauncher

    systemdgenie
    kdePackages.filelight
  ];
}
