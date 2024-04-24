{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./files/hyprland.conf;
  };

  home.file."hyprlock.conf" = {
    source = ./files/hyprlock.conf;
    target = ".config/hypr/hyprlock.conf";
  };
}
