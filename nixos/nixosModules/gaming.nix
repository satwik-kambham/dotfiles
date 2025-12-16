{ pkgs, pkgs-unstable, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    package = pkgs-unstable.steam;
  };

  environment.systemPackages = with pkgs; [
    # lutris
    # heroic
    (import ./scripts/hyprgame.nix { inherit pkgs; })
    gamescope
    protonup-qt
    mangohud
    gamemode
  ];
}
