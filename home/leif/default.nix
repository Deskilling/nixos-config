{ lib, config, username, ... }:
let
  dotfilesPath = "/etc/nixos/home/${username}/dotfiles";
  link = name: config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/${name}";
in
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.${username} = {
    imports = lib.filesystem.listFilesRecursive ./apps;

    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "25.11";

    home.file = builtins.listToAttrs (
      map (name: {
        name = ".config/${name}";
        value.source = link name;
      }) (builtins.attrNames (builtins.readDir ./dotfiles))
    );
  };
}
