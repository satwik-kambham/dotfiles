{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./files/tmux.conf;
    mouse = true;
    shortcut = "a";
    terminal = "screen-256color";
  };
}
