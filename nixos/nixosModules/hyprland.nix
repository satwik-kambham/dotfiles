{ pkgs, lib, ... }:

{
  # Enable xserver
  services.xserver.enable = true;

  # Plymouth
  boot = {
    # plymouth = {
    #   enable = true;
    #   theme = "circle_hud";
    #   themePackages = with pkgs; [
    #     (adi1090x-plymouth-themes.override {
    #       selected_themes = [ "cuts" "circle_hud" ];
    #     })
    #   ];
    # };

    # consoleLogLevel = 3;
    # initrd.verbose = false;
    # kernelParams = [
    #   "quiet"
    #   "splash"
    #   "boot.shell_on_fail"
    #   "udev.log_priority=3"
    #   "rd.systemd.show_status=auto"
    # ];
    loader.timeout = 0;
  };

  # Enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # XDG desktop portals
  xdg.portal = {
    enable = true;
    # extraPortals = lib.mkForce [
    #   pkgs.xdg-desktop-portal-gtk
    # ];
  };

  # Enable polkit
  security.polkit.enable = true;

  # Enable gnome keyring with gdm
  security.pam.services.gdm-password.enableGnomeKeyring = true;

  # Hyprland electron fix
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    (import ./scripts/hyprmonitor.nix { inherit pkgs; })
    # Terminal Emulators
    alacritty

    waybar # Status Bar
    eww # Status Bar
    dunst # Notification Daemon
    swww # Wallpaper Manager
    waypaper # Wallpaper Manager
    rofi-wayland # Launcher
    networkmanagerapplet # NM Applet
    brightnessctl # Brightness controller
    playerctl # Media controller
    cliphist # Clipboard Manager
    wl-clipboard # Clipboard Manager
    nautilus # File Manager
    sushi # File Previewer
    lxqt.lxqt-policykit # Auth agent
    hyprlock # Screen Lock
    grimblast # Screnshot Tool
    socat
  ];
}
