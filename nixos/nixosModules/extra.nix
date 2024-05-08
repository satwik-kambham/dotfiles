{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop # System Monitor
    ncdu # Disk space analyser
    evince # PDF reader
    thunderbird # Email client
    obsidian # Note taking app
    zed-editor # Extra code editor
    ollama # LLM inference engine
    todo-txt-cli # Todo.txt CLI
    rclone # Cloud sync CLI
  ];
}
