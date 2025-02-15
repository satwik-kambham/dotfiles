{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop # System monitor
    evince # PDF reader
    ollama
  ];
}
