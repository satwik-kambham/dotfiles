{ pkgs, ... }:

{
  # Enable sound
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # QMK
  hardware.keyboard.qmk.enable = true;
  environment.systemPackages = with pkgs; [
    qmk
    via
  ];
  services.udev.packages = [ pkgs.via ];
}
