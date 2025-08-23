{
  description = "My Simple NixOS configuration";

  inputs = {
    # NixOS 25.05
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager?ref=release-25.05";

    # Rift editor
    rift.url = "github:satwik-kambham/rift";
  };

  outputs = { self, nixpkgs, rift, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      rift_pkgs = rift.packages.${system};
    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;
      nixosConfigurations = {
        acer = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs rift_pkgs; };
          modules = [
            ./hosts/acer/configuration.nix
          ];
        };
      };
    };
}
