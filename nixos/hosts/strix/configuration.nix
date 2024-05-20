{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules/core.nix
    ../../nixosModules/extra.nix
    ../../nixosModules/scripts/scripts.nix
    ../../nixosModules/hyprland.nix
    ../../nixosModules/gnome.nix
    ../../nixosModules/kde.nix
    ../../nixosModules/hardware.nix
    ../../nixosModules/nvidia.nix
    ../../nixosModules/development.nix
    ../../nixosModules/gaming.nix
    ../../nixosModules/virtualization.nix
    ../../nixosModules/flatpak.nix
    ../../nixosModules/cachix.nix
    ../../nixosModules/nixvim.nix
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

  # Asus stuff
  programs.rog-control-center.enable = true;
  services.asusd = {
    enable = true;
    enableUserService = true;
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
  services.libinput.enable = true;

  programs.zsh.shellAliases = {
    update = "sudo nixos-rebuild switch --flake .#strix";
    update-safe = "sudo nixos-rebuild boot --flake .#strix";
    t = "todo.sh";
  };

  # Networking hostname
  networking.hostName = "satwik-strix";
}
