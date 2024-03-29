{ pkgs, ... }:

{
  # Environmental variables for hyprland to work well on nvidia hardware
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
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
  };
}
