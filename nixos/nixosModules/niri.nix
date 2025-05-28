{ pkgs, pkgs-unstable, ... }:

{
  programs.niri.enable = true;
  programs.niri.package = pkgs-unstable.niri;
}
