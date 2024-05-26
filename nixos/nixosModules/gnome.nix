{ pkgs, ... }:

{
  # services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    # gnomeExtensions.pop-shell
    # pop-launcher
    gnomeExtensions.forge
  ];
}
