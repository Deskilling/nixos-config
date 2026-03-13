{ pkgs, ... }:
{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      # lsblk -> uuid für windows boot entry
      extraEntries = ''
        menuentry "Windows" --class windows {
          insmod part_gpt
          insmod fat
          insmod chain
          search --no-floppy --fs-uuid --set=root 2E87-A21C
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }

        menuentry "Reboot into BIOS/UEFI" {
          fwsetup
        }
      '';
    };
  };

  boot.loader.grub.splashImage = null;
  boot.loader.grub.theme = pkgs.minimal-grub-theme;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.kernelParams = [
    "nowatchdog"
    "nmi_watchdog=0"
    "quiet"
    "splash"
  ];

  boot.plymouth = {
    enable = true;
    theme = "fade-in";
  };

  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.initrd.systemd.enable = true;
}
