{ config, pkgs, inputs, enableExtra, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules/core.nix
    ../../nixosModules/hardware.nix
    ../../nixosModules/extra.nix
    ../../nixosModules/development.nix
    ../../nixosModules/cachix.nix
    ../../nixosModules/flatpak.nix
    ../../nixosModules/gnome.nix
    ../../nixosModules/hyprland.nix
    ../../nixosModules/niri.nix
    ../../nixosModules/virtualization.nix
    inputs.home-manager.nixosModules.default
  ] ++ lib.optionals enableExtra [
    ../../nixosModules/nvidia.nix
    ../../nixosModules/gaming.nix
  ];

  # Defining user accounts. Don't forget to set a password with 'passwd'.
  users.users.satwik = {
    description = "satwik";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox-bin
      chromium
      (qutebrowser.override { enableWideVine = true; })
      discord
    ];
    shell = pkgs.zsh;
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs enableExtra; };
    users = {
      "satwik" = import ./home.nix;
    };
  };

  # Enable touchpad support
  services.libinput.enable = true;

  # Zsh aliases
  programs.zsh.shellAliases = {
    update = "sudo nixos-rebuild switch --flake .#strix";
    update-safe = "sudo nixos-rebuild boot --flake .#strix";
    rt = "rift_tui .";
    re = "rift_egui . &";
  };

  # Networking hostname
  networking.hostName = "satwik-strix";
}
