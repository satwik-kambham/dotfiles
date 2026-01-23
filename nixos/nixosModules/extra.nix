{ pkgs, pkgs-unstable, ... }:

{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };

  # Plymouth
  boot = {
    # plymouth = {
    #   enable = true;
    #   theme = "circle_hud";
    #   themePackages = with pkgs; [
    #     (adi1090x-plymouth-themes.override {
    #       selected_themes = [ "cuts" "circle_hud" ];
    #     })
    #   ];
    # };

    # consoleLogLevel = 3;
    # initrd.verbose = false;
    # kernelParams = [
    #   "quiet"
    #   "splash"
    #   "boot.shell_on_fail"
    #   "udev.log_priority=3"
    #   "rd.systemd.show_status=auto"
    # ];
    loader.timeout = 0;
  };

  environment.systemPackages = (with pkgs; [
    (btop.override {
      cudaSupport = true;
    })
    ncdu # Disk space analyser
    evince # PDF reader
    maestral
    maestral-gui
    obsidian
    vlc
    pavucontrol
  ]) ++ (with pkgs-unstable; [
    # (ollama.override {
    #   acceleration = "cuda";
    # })
    # (llama-cpp.override {
      # cudaSupport = true;
    # })
  ]);
}
