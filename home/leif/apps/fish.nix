{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
      {
        name = "sudope";
        src = pkgs.fishPlugins.plugin-sudope.src;
      }
    ];
  };
}
