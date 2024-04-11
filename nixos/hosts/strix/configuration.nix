{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules/core.nix
    ../../nixosModules/extra.nix
    ../../nixosModules/hyprland.nix
    ../../nixosModules/gnome.nix
    ../../nixosModules/hardware.nix
    ../../nixosModules/nvidia.nix
    ../../nixosModules/development.nix
    ../../nixosModules/steam.nix
    # ../../nixosModules/virtualbox.nix
    ../../nixosModules/flatpak.nix
    ../../nixosModules/cachix.nix
    inputs.home-manager.nixosModules.default
  ];

  # Defining user accounts. Don't forget to set a password with ‘passwd’.
  users.users.satwik = {
    isNormalUser = true;
    description = "satwik";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      epiphany
      spotify
    ];
    shell = pkgs.zsh;
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "satwik" = import ./home.nix;
    };
  };

  # Nvidia Prime
  hardware.nvidia = {
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  programs.zsh.shellAliases = {
    update = "sudo nixos-rebuild switch --flake .#strix";
  };

  # Networking hostname
  networking.hostName = "satwik-strix";
}
