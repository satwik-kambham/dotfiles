{ pkgs, ... }:

{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.forge
    gnomeExtensions.clipboard-history
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.pop-shell
  ];
}
