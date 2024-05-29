{
  description = "Deep learning devshell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.cudaSupport = true;
      };

      catppuccin-jupyterlab = pkgs.python3.pkgs.buildPythonPackage rec {
        pname = "catppuccin_jupyterlab";
        version = "0.2.1";
        pyproject = true;

        src = pkgs.fetchPypi {
          inherit pname version;
          hash = "sha256-dMXDFts6LFdoC1xBML9B1+QuK1mFd5+OklzjrSrRWI4=";
        };

        buildInputs = with pkgs.python3Packages; [
          hatch-jupyter-builder
          hatch-nodejs-version
          hatchling
          jupyterlab
        ];

        propagatedBuildInputs = with pkgs.python3Packages; [
          async-lru
          httpx
          packaging
          tornado
          ipykernel
          jupyter-core
          jupyter-lsp
          jupyterlab-server
          jupyter-server
          notebook-shim
          jinja2
          tomli
        ];
      };
      catppuccin-matplotlib = pkgs.python3.pkgs.buildPythonPackage rec {
        pname = "catppuccin-matplotlib";
        version = "0.4";
        pyproject = true;

        src = pkgs.fetchPypi {
          inherit pname version;
          hash = "sha256-c2iAqlazWRiW9EOAWM40hKsgctICVeISN8oM21DCFNY=";
        };

        buildInputs = with pkgs.python3Packages; [
          setuptools
          matplotlib
        ];

        propagatedBuildInputs = with pkgs.python3Packages; [
          matplotlib
        ];
      };
    in
    {
      devShell.${system} = pkgs.mkShell {
        packages = [
          (pkgs.python3.withPackages (p: [
            p.ipython
            p.jupyterlab
            p.jupyterlab-widgets
            catppuccin-jupyterlab
            catppuccin-matplotlib

            p.numpy
            p.pandas
            p.matplotlib
            p.bokeh
            p.seaborn
            p.scipy
            p.tqdm
            # p.wandb

            # p.scikit-learn

            p.torch
            p.torchvision
            p.pytorch-lightning

            # p.jax
            # p.jaxlibWithCuda

            # p.gradio
            p.python-lsp-server
            p.python-lsp-ruff
          ]))

          pkgs.ruff
        ];
      };
    };
}
