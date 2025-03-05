{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Text Editors
    helix

    git
    difftastic
    gh
    curl
    wget
    coreutils
    gnumake
    ripgrep
    fd
    fzf
    tmux
    zellij
    eza
    zoxide
    bat
    podman-tui
    distrobox
    nil
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
      cairo
      atk
      gdk-pixbuf
      fontconfig
      freetype
      dbus
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
    fira-code-nerdfont
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
      gpu = "git pull";
      gc = "git commit -m";
    };

    histSize = 10000;
  };

  programs.starship = {
    enable = true;
  };
}
