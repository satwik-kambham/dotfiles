{ pkgs, pkgs-unstable, ... }:

{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "satwik";
    dataDir = "/home/satwik/Documents";
  };
}
