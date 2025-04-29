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
  
  # Android Stuff
  programs.adb.enable = true;
  users.users.satwik.extraGroups = [ "kvm" "adbusers" "libvirtd" ];
}
