{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop # System Monitor
    evince # PDF reader
    thunderbird # Email client
    obsidian # Note taking app
    zed-editor # Extra code editor
    ollama # LLM inference engine
  ];
}
