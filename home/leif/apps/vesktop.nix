{ ... }:
{
  programs.vesktop = {
    enable = true;

    settings = {
      discordBranch = "stable";

      appBadge = true;
      arRPC = true;
      checkUpdates = true;
      customTitleBar = false;
      disableMinSize = false;
      minimizeToTray = true;
      autoStartMinimized = true;
      tray = true;
      hardwareAcceleration = true;
    };

    vencord.settings.plugins = {
      CustomIdle = {
        enabled = true;
        idleTimeout = 0;
        remainInIdle = 0;
      };

      AnonymiseFileNames.enabled = true;
      BetterSettings.enabled = true;
      CallTimer.enabled = true;
      ClearURLs.enabled = true;
      FavoriteEmojiFirst.enabled = true;
      FixImagesQuality.enabled = true;
      FixYoutubeEmbeds.enabled = true;
      FriendsSince.enabled = true;
      GameActivityToggle.enabled = true;
      GifPaste.enabled = true;
      YoutubeAdblock.enabled = true;
      VolumeBooster.enabled = true;
      Unindent.enabled = true;
      SilentTyping.enabled = true;
    };
  };
}
