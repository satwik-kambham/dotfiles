{ pkgs, ... }:

{
  # Helix
  programs.helix = {
    enable = true;
    settings = {
      theme = "fleet_dark_transparent";
      editor.soft-wrap.enable = true;
    };
    themes.fleet_dark_transparent = {
      inherits = "fleet_dark";
      "ui.background" = {};
      "ui.statusline" = {
        fg = "#d1d1d1";
      };
    };
  };

}
