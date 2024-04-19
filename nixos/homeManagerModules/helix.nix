{ pkgs, ... }:

{
  # Helix
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha_transparent";
      editor.soft-wrap.enable = true;
    };
    themes.catppuccin_mocha_transparent = {
      inherits = "catppuccin_mocha";
      "ui.background" = { };
      "ui.statusline" = {
        fg = "#d1d1d1";
      };
    };
  };

}
