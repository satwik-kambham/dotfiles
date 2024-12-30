{
  description = "My NixOS configuration";

  inputs = {
    # NixOS 24.11
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager?ref=release-24.11";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;
      nixosConfigurations = {
        strix = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/strix/configuration.nix
          ];
        };
      };
    };
}
