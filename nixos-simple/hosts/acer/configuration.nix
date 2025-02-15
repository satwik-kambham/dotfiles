{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules/core.nix
    ../../nixosModules/hardware.nix
    ../../nixosModules/extra.nix
    ../../nixosModules/development.nix
    ../../nixosModules/flatpak.nix
    ../../nixosModules/gnome.nix
    inputs.home-manager.nixosModules.default
  ];

  # Defining user accounts. Don't forget to set a password with 'passwd'.
  users.users.raghava = {
    description = "raghava";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox-bin
      epiphany
    ];
    shell = pkgs.zsh;
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "raghava" = import ./home.nix;
    };
  };

  # Enable touchpad support
  services.libinput.enable = true;

  # Zsh aliases
  programs.zsh.shellAliases = {
    update = "sudo nixos-rebuild switch --flake .#acer";
    update-safe = "sudo nixos-rebuild boot --flake .#acer";
  };

  # Networking hostname
  networking.hostName = "raghava-acer";
}
