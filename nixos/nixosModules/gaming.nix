{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    lutris
    # heroic
    (import ./scripts/hyprgame.nix { inherit pkgs; })
    gamescope
    protonup-qt
  ];
}
