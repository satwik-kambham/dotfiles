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

  # Git
  programs.git = {
    enable = true;
    userName = "Satwik Kambham";
    userEmail = "satwik.kambham@gmail.com";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Difftastic
  programs.git.difftastic = {
    enable = true;
  };

  # Alacritty
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 16;
      window.opacity = 0.7;
      colors = {
        primary = {
          background = "#1E1E2E";
          foreground = "#CDD6F4";
          dim_foreground = "#CDD6F4";
          bright_foreground = "#CDD6F4";
        };
        cursor = {
          text = "#1E1E2E";
          cursor = "#F5E0DC";
        };
        vi_mode_cursor = {
          text = "#1E1E2E";
          cursor = "#B4BEFE";
        };
        search.matches = {
          foreground = "#1E1E2E";
          background = "#A6ADC8";
        };
        search.focused_match = {
          foreground = "#1E1E2E";
          background = "#A6E3A1";
        };
        footer_bar = {
          foreground = "#1E1E2E";
          background = "#A6ADC8";
        };
        hints.start = {
          foreground = "#1E1E2E";
          background = "#F9E2AF";
        };
        hints.end = {
          foreground = "#1E1E2E";
          background = "#A6ADC8";
        };
        selection = {
          text = "#1E1E2E";
          background = "#F5E0DC";
        };
        normal = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };
        bright = {
          black = "#585B70";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#A6ADC8";
        };
        dim = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };
        indexed_colors = [
          {
            index = 16;
            color = "#FAB387";
          }
          {
            index = 17;
            color = "#F5E0DC";
          }
        ];
      };
    };
  };

  # Dunst
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#89B4FA";
        separator_color = "frame";
      };
      urgency_low = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
      };
      urgency_normal = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
      };
      urgency_critical = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
        frame_color = "#FAB387";
      };
    };
  };

  # Helix
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
    };
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
