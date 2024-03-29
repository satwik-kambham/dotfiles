{ pkgs, ... }:

{
  # Bootloader
  boot.loader.systemmd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;

  # Time Zone
  time.timeZone = "Asia/Kolkata";

  # Internationalisation
  il8n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
    };
  };

  # Keyboard layout
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Unable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Garbage collector
  nix.gc = {
    automatic = true;
    persistent = true;
    dates = "weekly";
  };

  # System State Version
  system.stateVersion = "23.11";
}
