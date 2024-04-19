{ pkgs, ... }:

{
  # virtualisation.virtualbox.host.enable = true;
  # users.extraGroups.vboxusers.members = [ "satwik" ];
  environment.systemPackages = with pkgs; [
    gnome.gnome-boxes
  ];
}
