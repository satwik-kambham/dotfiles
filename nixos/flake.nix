{
  description = "My NixOS configuration";

  inputs = {
    # NixOS 25.11
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager?ref=release-25.11";

    # NixOS Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Rift editor
    rift.url = "github:satwik-kambham/rift";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-hardware, rift, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      rift_pkgs = rift.packages.${system};
      enableExtra = true;
    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;
      nixosConfigurations = {
        strix = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs pkgs-unstable rift_pkgs enableExtra; };
          modules = [
            ./hosts/strix/configuration.nix
          ];
        };

        rpi = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs pkgs-unstable rift_pkgs; };
          modules = [
            ./hosts/rpi/configuration.nix
            nixos-hardware.nixosModules.raspberry-pi-4
          ];
        };
      };
    };
}
