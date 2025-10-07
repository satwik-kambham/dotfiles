{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../nixosModules/cachix.nix
      ../../nixosModules/flatpak.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  hardware.raspberry-pi."4".fkms-3d.enable = true;

  networking.hostName = "satwik-rpi";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  programs.niri.enable = true;

  # Enable polkit
  # security.polkit.enable = true;

  # Enable gnome keyring with gdm
  # security.pam.services.gdm-password.enableGnomeKeyring = true;

  services.xserver.xkb.layout = "us";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
    automatic = true;
    persistent = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.satwik= {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      firefox-bin
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

  # Zsh aliases
  programs.zsh.shellAliases = {
    update = "sudo nixos-rebuild switch --flake .#rpi";
    update-safe = "sudo nixos-rebuild boot --flake .#rpi";
    rt = "rift_tui";
    re = "rift_egui &";
  };

  environment.systemPackages = with pkgs; [
    libraspberrypi
    ncdu
    btop
    
    helix
    # rift_pkgs.rift_egui
    # rift_pkgs.rift_tui

    git
    difftastic
    gh
    curl
    wget
    coreutils
    ripgrep
    fd
    fzf
    tmux
    eza
    zoxide
    bat
    nil

    # Terminal Emulators
    alacritty

    waybar # Status Bar
    eww # Status Bar
    dunst # Notification Daemon
    swww # Wallpaper Manager
    waypaper # Wallpaper Manager
    rofi-wayland # Launcher
    networkmanagerapplet # NM Applet
    brightnessctl # Brightness controller
    playerctl # Media controller
    cliphist # Clipboard Manager
    wl-clipboard # Clipboard Manager
    nautilus # File Manager
    sushi # File Previewer
    lxqt.lxqt-policykit # Auth agent
    socat
    xwayland-satellite
  ];

  programs.direnv.enable = true;

  fonts.packages = with pkgs; [
    monaspace
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
      gd = "git -c diff.external=difft diff";
      gdc = "git -c diff.external=difft diff --cached";
      ga = "git add .";
      gp = "git push";
      gpu = "git pull";
      gc = "git commit -m";
      check-temp = "sudo vcgencmd measure_temp";
    };

    histSize = 10000;
  };

  programs.starship = {
    enable = true;
  };

  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  system.stateVersion = "25.05";
}
