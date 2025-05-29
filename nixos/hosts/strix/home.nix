{ config, pkgs, inputs, lib, enableExtra, ... }:

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
  ] ++ lib.optionals enableExtra [
    ../../homeManagerModules/rift.nix
    ../../homeManagerModules/gtk.nix
    ../../homeManagerModules/qt.nix
    # ../../homeManagerModules/hyprland.nix
    ../../homeManagerModules/rofi.nix
    ../../homeManagerModules/waybar.nix
  ];

  home.username = "satwik";
  home.homeDirectory = "/home/satwik";

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
