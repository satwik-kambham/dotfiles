{ config, pkgs, ... }:

{
  home.username = "satwik";
  home.homeDirectory = "/home/satwik";

  # Dark Mode
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
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

  # QT Theme
  qt = {
    enable = true;
    platformTheme = "gnome";
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };

  # Cursor theme
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.mochaGreen;
    name = "Catppuccin-Mocha-Green-Cursors";
    size = 28;
  };

  # Starship
  programs.starship = {
    enable = true;
    settings = {
      format = "$all";
      add_newline = false;
      aws.disabled = true;
      azure.disabled = true;
      gcloud.disabled = true;
    };
  };

  # # Difftastic
  # programs.git.difftastic = {
  #   enable = true;
  #   background = "dark";
  # };

  # programs.git.extraConfig = {
  #   diff.external = "difft";
  # };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
