{ pkgs, ... }:
pkgs.writeShellScriptBin "hyprmonitor" ''
  output=$(hyprctl monitors)

  if echo "$output" | grep -q "eDP-1"; then
      hyprctl keyword monitor "eDP-1, disable"
  else
      hyprctl keyword monitor "eDP-1, preferred, auto, 1"
  fi
''
