{ config, pkgs, rift_pkgs, ... }:

{
  imports = [
    ./homeManagerModules/starship.nix
    ./homeManagerModules/helix.nix
    ./homeManagerModules/git.nix
    ./homeManagerModules/zsh.nix
    ./homeManagerModules/tmux.nix
    ./homeManagerModules/zoxide.nix
  ];

  home.username = "satwik";
  home.homeDirectory = "/home/satwik";

  home.stateVersion = "24.11";

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    rift_pkgs.rift_egui
    rift_pkgs.rift_tui

    curl
    wget
    coreutils
    gnumake
    ripgrep
    fd
    fzf
    eza
    bat
    nil

    nerd-fonts.fira-code
    nerd-fonts.monaspace
    vistafonts
  ];

  programs.direnv = {
    enable = true;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/satwik/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
