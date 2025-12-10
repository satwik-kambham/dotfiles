{ pkgs, pkgs-unstable, ... }:

{
  programs.niri.enable = true;
  programs.niri.package = pkgs-unstable.niri;

  # Enable polkit
  security.polkit.enable = true;

  # Enable gnome keyring with gdm
  security.pam.services.gdm-password.enableGnomeKeyring = true;

  environment.systemPackages = with pkgs; [
    # Terminal Emulators
    alacritty

    waybar # Status Bar
    eww # Status Bar
    dunst # Notification Daemon
    swww # Wallpaper Manager
    waypaper # Wallpaper Manager
    rofi # Launcher
    networkmanagerapplet # NM Applet
    brightnessctl # Brightness controller
    playerctl # Media controller
    cliphist # Clipboard Manager
    wl-clipboard # Clipboard Manager
    nautilus # File Manager
    sushi # File Previewer
    lxqt.lxqt-policykit # Auth agent
    socat
    xwayland-satellite
  ];
}
