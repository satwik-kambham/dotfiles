{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop # System monitor
    ncdu # Disk space analyser
    evince # PDF reader
    obsidian # Note taking app
    ollama # LLM inference engine
    maestral
    maestral-gui
    zathura
  ];

  nixpkgs.config.zathura.useMupdf = true;
}
