{ config, pkgs, ... }:

{
  # Dark Mode
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
  };

  # GTK Theme
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Green-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "green" ];
        variant = "mocha";
      };
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  # Cursor theme
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.mochaGreen;
    name = "Catppuccin-Mocha-Green-Cursors";
    size = 28;
  };
}
