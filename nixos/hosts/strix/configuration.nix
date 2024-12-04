{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules/core.nix
    ../../nixosModules/hardware.nix
    ../../nixosModules/extra.nix
    ../../nixosModules/development.nix
    ../../nixosModules/cachix.nix
    ../../nixosModules/flatpak.nix
    ../../nixosModules/gaming.nix
    ../../nixosModules/gnome.nix
    ../../nixosModules/awesome.nix
    ../../nixosModules/hyprland.nix
    ../../nixosModules/nvidia.nix
    ../../nixosModules/virtualization.nix
    inputs.home-manager.nixosModules.default
  ];

  # Defining user accounts. Don't forget to set a password with 'passwd'.
  users.users.satwik = {
    description = "satwik";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox-bin
      epiphany
      chromium
      (qutebrowser.override { enableWideVine = true; })
      spotify
      discord
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

  # Asusd
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

  # Enable touchpad support
  services.libinput.enable = true;

  # Zsh aliases
  programs.zsh.shellAliases = {
    update = "sudo nixos-rebuild switch --flake .#strix";
    update-safe = "sudo nixos-rebuild boot --flake .#strix";
  };

  # Networking hostname
  networking.hostName = "satwik-strix";
}
