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
    (todofi-sh.override {
      rofi = rofi-wayland;
    }) # Todo.txt Rofi
    rclone # Cloud sync CLI
  ];
}
