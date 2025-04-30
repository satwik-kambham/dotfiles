{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = (with pkgs; [
    (btop.override {
      cudaSupport = true;
    })
    ncdu # Disk space analyser
    evince # PDF reader
    maestral
    maestral-gui
    obsidian
  ]) ++ (with pkgs-unstable; [
    # ollama-cuda
  ]);
}
