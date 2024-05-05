{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Text Editors
    helix
    vscode
    (appimageTools.wrapType2 {
      name = "papyrus";
      src = fetchurl {
        url = "https://github.com/satwik-kambham/papyrus/releases/download/app-v0.0.0/papyrus_0.1.0_amd64.AppImage";
        hash = "sha256-dyN0RN4vswDSa2U3udhu0GsC/KVLLjAkbhK3R2z8ZHk=";
      };
    })
    jetbrains.pycharm-community
    emacs-gtk

    git
    difftastic
    gh
    curl
    wget
    gnumake
    ripgrep
    tmux
    eza
    zoxide
    bat
    nvidia-podman
    podman-tui
    podman-desktop
    nil
    # cachix
    # devenv
  ];

  # Containerization
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  hardware.nvidia-container-toolkit.enable = true;

  # direnv
  programs.direnv = {
    enable = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    monaspace
    vistafonts
  ];

  # ZSH config
  environment.shells = with pkgs; [ zsh ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      l = "eza -la --icons=auto";
      li = "l --git-ignore";
      lt = "li -T";
      shx = "sudo hx";
    };

    histSize = 10000;

    # ohMyZsh = {
    #   enable = true;
    #   plugins = [ "git" ];
    #   theme = "robbyrussell";
    # };
  };

  programs.starship = {
    enable = true;
  };
}
