{ pkgs, inputs, ... }: {

  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
    theme = "monochrome_vivid";

    # Configure bar layouts for monitors.
    # See 'https://hyprpanel.com/configuration/panel.html'.
    # Default: null
    layout = {
      "bar.layouts" = {
        "*" = {
          left = [ "dashboard" "workspaces" "systray" ];
          middle = [ "media" ];
          right = [ "clock" "volume" "bluetooth" "notifications" ];
        };
      };
    };

    # Configure and theme almost all options from the GUI.
    # Options that require '{}' or '[]' are not yet implemented,
    # except for the layout above.
    # See 'https://hyprpanel.com/configuration/settings.html'.
    # Default: <same as gui>
    settings = {
      bar.launcher.autoDetectIcon = true;

      bar.workspaces.show_icons = true;
      # Mouse wheel scrool down for the next workspace.
      bar.workspaces.reverse_scroll = true;

      bar.clock.format = "%H:%M";
      bar.clock.showIcon = false;
      bar.clock.icon = "";

      bar.volume.scrollUp = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+";
      bar.volume.scrollDown = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-";

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = true;

      menus.dashboard.shortcuts.left.shortcut1.icon = "";
      menus.dashboard.shortcuts.left.shortcut1.tooltip = "Floorp";
      menus.dashboard.shortcuts.left.shortcut1.command = "floorp";

      menus.dashboard.shortcuts.left.shortcut2.icon = "󰘑";
      menus.dashboard.shortcuts.left.shortcut2.command = "wechat";
      menus.dashboard.shortcuts.left.shortcut2.tooltip = ""; # TODO: wechat-uos

      menus.dashboard.shortcuts.left.shortcut3.icon = "󰝚";
      menus.dashboard.shortcuts.left.shortcut3.command = "yes-play-music";
      menus.dashboard.shortcuts.left.shortcut3.tooltip = "yesplaymusic";

      menus.dashboard.shortcuts.left.shortcut4.command =
        "pkill fuzzel || fuzzel --show drun";

      bar.network.label = true;
      bar.network.showWifiInfo = true;
      bar.network.truncation_size = 5;

      bar.notifications.hideCountWhenZero = true;

      theme.bar.opacity = 88;
      theme.bar.border.width = "0em";
      theme.bar.buttons.radius = "0.4em";
      theme.bar.buttons.y_margins = "0em";

      theme.bar.outer_spacing = "0em";
      theme.bar.margin_sides = "0em";
      theme.bar.margin_top = "0em";

      theme.font = {
        name = "LXGW WenKai Mono";
        size = "14px";
      };
    };
  };
}
