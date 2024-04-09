{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop # System Monitor
    evince # PDF reader
    thunderbird # Email client
    apostrophe # Markdown Editor
    errands # Todo App
  ];
}
