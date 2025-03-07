{ ... }: {
  programs.waybar.settings.mainBar = {
    position = "top";
    layer = "top";
    height = 6;
    margin-top = 2;
    margin-bottom = 2;
    margin-left = 2;
    margin-right = 2;
    round = 10;
    modules-left = [ "custom/launcher" "tray" ];
    modules-center = [ "clock" "hyprland/workspaces" ];
    modules-right = [ "pulseaudio" "cpu" "memory" "disk" "battery" "network" ];
    clock = {
      calendar = {
        format = { today = "<span color='#b4befe'><b><u>{}</u></b></span>"; };
      };
      #    
      format = "{:%H:%M}";
      tooltip = "true";
      tooltip-format = ''
        <big>{:%Y %B}</big>
        <tt><small>{calendar}</small></tt>'';
      format-alt = "{:%d/%m}";
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      # format = "{icon}";
      on-click = "activate";
      format-icons = {
        "1" = "1";
        "2" = "2";
        "3" = "3";
        "4" = "4";
        "5" = "5";
        "6" = "6";
        urgent = "";
        default = "";
        sort-by-number = true;
      };
      persistent-workspaces = {
        "1" = [ ];
        "2" = [ ];
        "3" = [ ];
        "4" = [ ];
        "5" = [ ];
      };
    };
    memory = {
      format = "󰟜 {}%";
      format-alt = "󰟜 {used} GiB"; # 
      interval = 2;
    };
    cpu = {
      format = "  {usage}%";
      format-alt = "  {avg_frequency} GHz";
      interval = 2;
    };
    disk = {
      # path = "/";
      format = "󰋊 {percentage_used}%";
      interval = 60;
    };
    network = {
      format-wifi = "  {signalStrength}%";
      format-ethernet = "󰀂 ";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "󰖪 ";
    };
    tray = {
      icon-size = 16;
      spacing = 8;
    };
    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "󰖁  {volume}%";
      format-icons = { default = [ " " ]; };
      scroll-step = 5;
      on-click = "pamixer -t";
    };
    battery = {
      format = "{icon} {capacity}%";
      format-icons = [ " " " " " " " " " " ];
      format-charging = " {capacity}%";
      format-full = " {capacity}%";
      format-warning = " {capacity}%";
      interval = 5;
      states = { warning = 20; };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
    };
    "custom/launcher" = {
      format = "";
      on-click = "pkill fuzzel || fuzzel --show drun";
      on-click-right = "pkill wofi || wallpaper-picker";
      tooltip = "false";
    };
  };
}
