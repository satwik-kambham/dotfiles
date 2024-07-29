{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop # System monitor
    ncdu # Disk space analyser
    evince # PDF reader
    obsidian # Note taking app
    ollama # LLM inference engine
  ];
}
