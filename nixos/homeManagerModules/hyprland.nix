{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./files/hyprland.conf;
  };
}
