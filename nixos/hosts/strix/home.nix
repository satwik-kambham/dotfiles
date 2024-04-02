{ config, pkgs, ... }:

{
  imports = [
    ../../homeManagerModules/alacritty.nix
    ../../homeManagerModules/gtk.nix
    ../../homeManagerModules/qt.nix
    ../../homeManagerModules/starship.nix
    ../../homeManagerModules/dunst.nix
    ../../homeManagerModules/helix.nix
    ../../homeManagerModules/git.nix
  ];

  home.username = "satwik";
  home.homeDirectory = "/home/satwik";

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
