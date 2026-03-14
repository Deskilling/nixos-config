{ pkgs, ... }:
{
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  environment.systemPackages = with pkgs; [
    git
    fastfetch
    fontconfig
    ffmpeg
    unrar
    btop
    kitty
  ];

  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      update = "sudo nix flake update --flake /etc/nixos";
      config = "sudo env ZED_ALLOW_ROOT=true zeditor /etc/nixos/";
      generations = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      gcl = "nix-collect-garbage -d";
    };
  };
}
