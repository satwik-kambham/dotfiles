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

    # Llama cpp
    llama-cpp.url = "github:ggml-org/llama.cpp";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-hardware, rift, llama-cpp, ... }@inputs:
    let
      enableExtra = true;
      hostSystems = {
        strix = "x86_64-linux";
        rpi = "aarch64-linux";
      };
      mkPkgsUnstable = system:
        import nixpkgs-unstable {
          inherit system;
          config = {
            allowUnfree = true;
          };
        };
      mkRiftPkgs = system: rift.packages.${system};
      mkLlamacppPkgs = system: llama-cpp.packages.${system};
      mkHost = { system, modules, extraSpecialArgs ? { } }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs enableExtra;
            pkgs-unstable = mkPkgsUnstable system;
            rift_pkgs = mkRiftPkgs system;
            llamacpp_pkgs = mkLlamacppPkgs system;
          } // extraSpecialArgs;
          inherit modules;
        };
    in
    {
      formatter = nixpkgs.lib.genAttrs
        (builtins.attrValues hostSystems)
        (system: (nixpkgs.legacyPackages.${system}).nixpkgs-fmt);
      nixosConfigurations = {
        strix = mkHost {
          system = hostSystems.strix;
          modules = [
            ./hosts/strix/configuration.nix
          ];
        };

        rpi = mkHost {
          system = hostSystems.rpi;
          modules = [
            ./hosts/rpi/configuration.nix
            nixos-hardware.nixosModules.raspberry-pi-4
          ];
        };
      };
    };
}
