{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "5px";
        spacing = 10;
        modules-left = [
          "wlr/taskbar"
          "cpu"
          "memory"
          "backlight"
          "pulseaudio"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "tray"
          "bluetooth"
          "network"
          "battery"
          "custom/lock"
          "custom/reboot"
          "custom/poweroff"
        ];
        "wlr/taskbar" = {
          on-click = "activate";
          format = "{icon}";
        };
        cpu = {
          interval = 15;
          format = "  {}%";
          max-length = 10;
        };
        memory = {
          interval = 30;
          format = "  {}%";
          max-length = 10;
        };
        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%a, %d %b, %I:%M %p}";
        };
        backlight = {
          device = "intel_backlight";
          tooltip = false;
          format = " {}%";
          interval = 1;
        };
        pulseaudio = {
          tooltip = false;
          scroll-step = 1;
          format = "{icon} {volume}%";
          format-muted = "{icon}";
          format-icons = {
            default = [ "" "" "" ];
          };
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon}  {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [ "" "" "" "" "" ];
        };
        bluetooth = {
          format = " {status}";
          format-disabled = "";
          format-connected = " {num_connections} connected";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr}";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        tray = {
          icon-size = 16;
          spacing = 10;
        };
        "custom/lock" = {
          format = "";
          on-click = "hyprlock";
        };
        "custom/reboot" = {
          format = "";
          on-click = "systemctl reboot";
        };
        "custom/poweroff" = {
          format = "";
          on-click = "systemctl poweroff";
        };
      };
    };
    style = builtins.readFile ./files/style.css;
  };
}
