{ pkgs, config, ... }:

{
  # Environmental variables for hyprland to work well on nvidia hardware
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    VK_DRIVER_FILES = "/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json:/run/opengl-driver/share/vulkan/icd.d/intel_icd.x86_64.json";
  };

  # GPU Drivers and other nvidia related configs
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Asusd
  programs.rog-control-center.enable = true;
  services.asusd = {
    enable = true;
    enableUserService = true;
  };

  # Nvidia Prime
  hardware.nvidia = {
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };

  hardware.nvidia-container-toolkit.enable = true;
}
