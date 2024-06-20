{
  description = "Mamba fhs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      fhs = pkgs.buildFHSUserEnv {
        name = "micromamba";

        targetPkgs = _: [
          pkgs.micromamba
        ];

        profile = ''
          set -e
          eval "$(micromamba shell hook --shell=posix)"
          export MAMBA_ROOT_PREFIX=${builtins.getEnv "PWD"}/.mamba
          # micromamba create -y -f environment.yml
          micromamba create -y -n pruner -f conda-lock.yml
          micromamba activate pruner
          pip install -e .
          set +e
        '';
      };
    in
    {
      devShells.${system}.default = fhs.env;
    };
}
