{ pkgs, ... }:

{
  # SDDM display Manager
  # services.xserver.displayManager.sddm = {
  #   enable = true;
  #   theme = "${ import ./sddm-theme.nix { inherit pkgs; } }";
  # };

  # Enable xserver
  services.xserver.enable = true;

  # Enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable polkit
  security.polkit.enable = true;

  # Hyprland electron fix
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    # Terminal Emulators
    alacritty
    kitty

    waybar # Status Bar
    eww # Status Bar
    dunst # Notification Daemon
    swww # Wallpaper Manager
    waypaper # Wallpaper Manager
    rofi-wayland # Launcher
    ulauncher # Alternate launcher
    networkmanagerapplet # NM Applet
    brightnessctl # Brightness controller
    cliphist # Clipboard Manager
    wl-clipboard # Clipboard Manager
    gnome.nautilus # File Manager
    gnome.sushi # File Previewer
    lxqt.lxqt-policykit # Auth agent

    # SDDM
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
