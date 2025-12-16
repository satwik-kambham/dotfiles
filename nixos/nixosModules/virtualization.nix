{ pkgs, ... }:

{
  # virtualisation.virtualbox.host.enable = true;
  # users.extraGroups.vboxusers.members = [ "satwik" ];
  environment.systemPackages = with pkgs; [
    gnome-boxes
    spice-vdagent
    distrobox
  ];
  virtualisation.libvirtd.enable = true;
  # users.users.satwik.extraGroups = [ "libvirtd" ];

  boot.extraModprobeConfig = ''
    options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1
  '';

  # Android Stuff
  programs.adb.enable = true;
  users.users.satwik.extraGroups = [ "kvm" "adbusers" "libvirtd" ];
}
