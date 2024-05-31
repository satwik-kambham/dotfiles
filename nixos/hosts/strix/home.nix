{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../homeManagerModules/alacritty.nix
    ../../homeManagerModules/gtk.nix
    ../../homeManagerModules/qt.nix
    ../../homeManagerModules/starship.nix
    ../../homeManagerModules/dunst.nix
    ../../homeManagerModules/helix.nix
    ../../homeManagerModules/emacs.nix
    ../../homeManagerModules/git.nix
    ../../homeManagerModules/waybar.nix
    ../../homeManagerModules/hyprland.nix
    ../../homeManagerModules/tmux.nix
    ../../homeManagerModules/zellij.nix
    ../../homeManagerModules/zoxide.nix
    ../../homeManagerModules/rofi.nix
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  home.username = "satwik";
  home.homeDirectory = "/home/satwik";

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
