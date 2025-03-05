{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop # System monitor
    ncdu # Disk space analyser
    evince # PDF reader
    ollama
    # ollama-cuda # LLM inference engine
    maestral
    maestral-gui
    gparted
  ];
}
