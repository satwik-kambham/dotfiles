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
    nb # Note taking CLI
    # rclone # Cloud sync CLI
  ];

  # Syncthing
  services.syncthing = {
    enable = true;
    user = "satwik";
    openDefaultPorts = true;
    dataDir = "/home/satwik/Documents/sync";
  };
}
