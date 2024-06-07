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
    coreutils
    gnumake
    ripgrep
    fd
    tmux
    zellij
    eza
    zoxide
    bat
    nvidia-podman
    podman-tui
    pods
    nil
    # cachix
    # devenv

    clang
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

  # Nix-ld
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # stdenv.cc.cc
      openssl
      xorg.libXcomposite
      xorg.libXtst
      xorg.libXrandr
      xorg.libXext
      xorg.libX11
      xorg.libXfixes
      libGL
      libva
      # pipewire.lib
      xorg.libxcb
      xorg.libXdamage
      xorg.libxshmfence
      xorg.libXxf86vm
      libelf

      # Required
      glib
      gtk2
      bzip2

      # Without these it silently fails
      xorg.libXinerama
      xorg.libXcursor
      xorg.libXrender
      xorg.libXScrnSaver
      xorg.libXi
      xorg.libSM
      xorg.libICE
      gnome2.GConf
      nspr
      nss
      cups
      libcap
      SDL2
      libusb1
      dbus-glib
      ffmpeg
      # Only libraries are needed from those two
      libudev0-shim

      # Verified games requirements
      xorg.libXt
      xorg.libXmu
      libogg
      libvorbis
      SDL
      SDL2_image
      glew110
      libidn
      tbb

      zlib

      # Other things from runtime
      flac
      freeglut
      libjpeg
      libpng
      libpng12
      libsamplerate
      libmikmod
      libtheora
      libtiff
      pixman
      speex
      SDL_image
      SDL_ttf
      SDL_mixer
      SDL2_ttf
      SDL2_mixer
      libappindicator-gtk2
      libdbusmenu-gtk2
      libindicator-gtk2
      libcaca
      libcanberra
      libgcrypt
      libvpx
      librsvg
      xorg.libXft
      libvdpau
      gnome2.pango
      cairo
      atk
      gdk-pixbuf
      fontconfig
      freetype
      dbus
      alsaLib
      expat
      # Needed for electron
      libdrm
      mesa
      libxkbcommon

      glib
      nss
      nspr
      dbus
      atk
      cups
      libdrm
      gtk3
      pango
      cairo
      xorg.libX11
      xorg.libXcomposite
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXrandr
      mesa
      expat
      xorg.libxcb
      libxkbcommon
      alsa-lib
      libglvnd
    ];
  };

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    monaspace
    vistafonts
    inter
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
      gs = "git status";
      gd = "git diff";
      gdc = "git diff --cached";
      ga = "git add .";
      gp = "git push";
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
