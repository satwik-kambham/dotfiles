{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop # System Monitor
    marktext # Markdown editor
    evince # PDF reader
  ];
}
