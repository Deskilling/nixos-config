{ pkgs, lib, ... }:
{
  home.activation.microPlugins = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.micro}/bin/micro -plugin install fzf
  '';
}
