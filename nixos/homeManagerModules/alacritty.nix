{ pkgs, ... }:

{
  # Alacritty
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 14;
        normal.family = "Monaspace Neon";
      };
      window = {
        # opacity = 0.7;
        padding = {
          x = 5;
          y = 5;
        };
        dynamic_padding = true;
      };
    };
  };
}
