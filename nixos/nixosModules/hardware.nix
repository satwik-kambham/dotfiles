{ pkgs, ... }:

{
  # Solution for heat (https://www.reddit.com/r/NixOS/comments/1712eoe/is_there_a_way_to_check_metricsheat_regarding_cpu/?rdt=44113)
  # services.auto-cpufreq.enable = true;

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
}
