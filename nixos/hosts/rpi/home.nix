{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ../../homeManagerModules/alacritty.nix
    ../../homeManagerModules/starship.nix
    ../../homeManagerModules/dunst.nix
    ../../homeManagerModules/helix.nix
    ../../homeManagerModules/git.nix
    ../../homeManagerModules/tmux.nix
    ../../homeManagerModules/zellij.nix
    ../../homeManagerModules/zoxide.nix
    ../../homeManagerModules/rift.nix
    ../../homeManagerModules/gtk.nix
    ../../homeManagerModules/qt.nix
    ../../homeManagerModules/rofi.nix
    ../../homeManagerModules/waybar.nix
  ];

  home.username = "satwik";
  home.homeDirectory = "/home/satwik";

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
