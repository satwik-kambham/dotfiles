{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    theme = ./files/rofi-theme.rasi;
    extraConfig = {
      modi = "drun,window";
    };
  };
}
