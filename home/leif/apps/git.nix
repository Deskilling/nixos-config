{ ... }:
{
  programs.git = {
    enable = true;

    userEmail = "81562562+Deskilling@users.noreply.github.com";
    userName = "Leif Haberecht";
  };

  programs.keychain = {
    enable = true;
    keys = [ "id_ed25519" ];
    extraFlags = [ "--quiet" ];
  };
}
