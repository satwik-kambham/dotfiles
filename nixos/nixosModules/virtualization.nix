{ pkgs, ... }:

{
  # virtualisation.virtualbox.host.enable = true;
  # users.extraGroups.vboxusers.members = [ "satwik" ];
  environment.systemPackages = with pkgs; [
    gnome.gnome-boxes
    spice-vdagent
    distrobox
  ];
  virtualisation.libvirtd.enable = true;
  users.users.satwik.extraGroups = [ "libvirtd" ];
}
