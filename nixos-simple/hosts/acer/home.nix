{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../homeManagerModules/alacritty.nix
    ../../homeManagerModules/qt.nix
    ../../homeManagerModules/starship.nix
    ../../homeManagerModules/helix.nix
    ../../homeManagerModules/git.nix
    ../../homeManagerModules/tmux.nix
    ../../homeManagerModules/zoxide.nix
  ];

  home.username = "raghava";
  home.homeDirectory = "/home/raghava";

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
