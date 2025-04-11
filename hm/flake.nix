{
  description = "Home Manager configuration of satwik";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Rift editor
    rift.url = "github:satwik-kambham/rift";
  };

  outputs = { nixpkgs, home-manager, rift, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      rift_pkgs = rift.packages.${system};
    in {
      homeConfigurations."satwik" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs rift_pkgs;

        modules = [ ./home.nix ];
      };
    };
}
