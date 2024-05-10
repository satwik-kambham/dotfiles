{ pkgs ? import <nixpkgs> {}}:
let
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
in fhs.env
