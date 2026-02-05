{ config, lib, pkgs, inputs, rift_pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../nixosModules/cachix.nix
      ../../nixosModules/syncthing.nix
      ../../nixosModules/niri.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  hardware.raspberry-pi."4".fkms-3d.enable = true;
  
  zramSwap.enable = true;

  networking.hostName = "satwik-rpi";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_US.UTF-8";

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
  hardware.raspberry-pi."4".bluetooth.enable = true;
  systemd.services.btattach = {
    before = [ "bluetooth.service" ];
    after = [ "dev-ttyAMA0.device" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.bluez}/bin/btattach -B /dev/ttyAMA0 -P bcm -S 3000000";
    };
  };
  services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.satwik= {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      firefox
      epiphany
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
  };

  environment.systemPackages = with pkgs; [
    libraspberrypi
    ncdu
    btop
    
    helix
    # rift_pkgs.rift_egui
    rift_pkgs.rift_tui

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
    rofi # Launcher
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

  programs.nix-ld.enable = true;

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

  # Environment Variables
  environment.variables = {
      EDITOR = "rt";
  };

  programs.starship = {
    enable = true;
  };

  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 8080 ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  system.stateVersion = "25.05";
}
