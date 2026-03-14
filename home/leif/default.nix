{ username, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${username} =
    { config, lib, ... }:
    {
      imports = lib.filesystem.listFilesRecursive ./apps;
      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.11";
      home.file = builtins.listToAttrs (
        map (f: {
          name = ".config/${lib.removePrefix (toString ./dotfiles + "/") (toString f)}";
          value = {
            source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/${username}/dotfiles/${
              lib.removePrefix (toString ./dotfiles + "/") (toString f)
            }";
            force = true;
          };
        }) (lib.filesystem.listFilesRecursive ./dotfiles)
      );
    };
}
