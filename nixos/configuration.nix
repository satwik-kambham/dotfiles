{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "satwik-nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Desktop managers, drivers, window managers, etc.

  # Enable display manager
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;
  services.xserver.displayManager.sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";

  # Enable X11 windowing system
  services.xserver.enable = true;

  # Enable Hyprland wayland compositor
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  security.polkit.enable = true;

  # Environmental variables for hyprland to work well on nvidia hardware
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # GPU Drivers and other nvidia related configs
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
  ];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
  
  # Solution for heat (https://www.reddit.com/r/NixOS/comments/1712eoe/is_there_a_way_to_check_metricsheat_regarding_cpu/?rdt=44113)
  services.auto-cpufreq.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Defining user accounts. Don't forget to set a password with ‘passwd’.
  users.users.satwik = {
    isNormalUser = true;
    description = "satwik";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      spotify
    ];
    shell = pkgs.zsh;
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "satwik" = import ./home.nix;
    };
  };
  
  # Opening port for syncing spotify
  networking.firewall.allowedTCPPorts = [ 57621 ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enabling experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    # Text Editor
    helix
    neovim
    vscode

    # Development Tools
    git
    gh
    curl
    wget
    gnumake
    ripgrep
    tmux
    eza
    nvidia-podman
    podman-tui
    podman-desktop

    # Monitoring tools
    btop

    # Terminal Emulators
    alacritty
    kitty

    # Hyprland
    waybar # Status Bar
    dunst # Notification Manager
    swww # Wallpapar Mamager
    rofi-wayland # Launcher
    networkmanagerapplet
    brightnessctl # Brightness controller
    hyprpicker # Color picker
    cliphist # Clipboard Manager
    wl-clipboard
    xfce.thunar # File Manager
    libsForQt5.qt5.qtquickcontrols2   
    libsForQt5.qt5.qtgraphicaleffects
  ];

  # Containerization
  virtualisation.podman = {
    enable = true;
  };
  virtualisation.containers.cdi.dynamic.nvidia.enable = true;
 
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
      update = "sudo nixos-rebuild switch --flake /etc/nixos#default";
      shx = "sudo hx";
    };
    
    histSize = 10000;
    
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  system.stateVersion = "23.11";

}
