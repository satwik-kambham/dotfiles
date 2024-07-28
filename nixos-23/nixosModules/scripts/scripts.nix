{ pkgs, ... }:
{
  environment.systemPackages = [
    (import ./todofi.nix { inherit pkgs; })
  ];
}
