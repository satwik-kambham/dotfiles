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
      export TMPDIR=/tmp
      micromamba create -y -f environment.yml
      # micromamba create -y -n mambaenv -f conda-lock.yml
      micromamba activate mambaenv
      # pip install -e .
      set +e
    '';
  };
in fhs.env
