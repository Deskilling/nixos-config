{ ... }:
{
  programs.git = {
    enable = true;

    userEmail = "deskilling@tuta.io";
    userName = "Leif Haberecht";
  };

  programs.keychain = {
    enable = true;
    keys = [ "id_ed25519" ];
    extraFlags = [ "--quiet" ];
  };
}
