{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop # System Monitor
    evince # PDF reader
    thunderbird # Email client
    errands # Todo App
    obsidian # Note taking app
    zed-editor # Extra code editor
  ];
}
