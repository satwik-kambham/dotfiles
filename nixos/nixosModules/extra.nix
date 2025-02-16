{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop # System monitor
    ncdu # Disk space analyser
    evince # PDF reader
    obsidian # Note taking app
    ollama-cuda # LLM inference engine
    maestral
    maestral-gui
    zathura
    gparted
  ];

  nixpkgs.config.zathura.useMupdf = true;
}
