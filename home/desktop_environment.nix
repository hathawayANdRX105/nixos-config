{ config, pkgs, ... }: {
  home.packages = with pkgs; [ wayland ];

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
    # gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    # GTK_THEME = config.gtk.theme.name;
    XCURSOR_SIZE = config.home.pointerCursor.size;
    XCURSOR_THEME = config.home.pointerCursor.name;
  };

  systemd.user.targets.hyprland-session.Unit.Wants =
    [ "xdg-desktop-autostart.target" ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      "$mainMod" = "SUPER";

      exec-once = [
        "hypridle"
        "hyprpanel"
        "fcitx5"
        "swww-daemon | swww img /etc/nixos/wallpaper/miku.jpg"
        "hyprctl setcursor Bibata-Modern-Ice 24"
        "[workspace 5 silent] nekoray"
        "[workspace 5 silent] yesplaymusic"
        "[workspace 1 silent] wechat-uos"
        "[workspace 1] floorp"
        "[workspace 1 silent] alacritty"
      ];

      input = {
        kb_layout = "us";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = -0.7;
        touchpad = { natural_scroll = false; };
      };

      general = {
        layout = "dwindle";
        gaps_in = 2;
        gaps_out = 2;
        border_size = 0;

        "col.active_border" = "rgb(cba6f7) rgb(94e2d5) 45deg";
        "col.inactive_border" = "0x00000000";
      };

      misc = {
        disable_autoreload = true; # use "hyprctl reload" manually reload config
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
        vfr = true;
      };

      dwindle = {
        # no_gaps_when_only = true;
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      decoration = {
        rounding = 5;

        active_opacity = 0.93;
        inactive_opacity = 0.93;

        dim_inactive = false;
        # dim_strength = 0;
        # dim_strength = 7.5e-2;

        blur.enabled = false;
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];

        animation = [
          # Windows
          "windowsIn, 1, 3, easeOutCubic, popin 30%"
          "windowsOut, 1, 3, fluent_decel, popin, 70%"
          "windowsMove, 1, 2, easeinoutsine, slide"

          # Fade
          "fadeIn, 1, 3, easeOutCubic"
          "fadeOut, 1, 2, easeOutCubic"
          "fadeSwitch, 0, 1, easeOutCirc"
          "fadeShadow, 1, 10, easeOutCirc"
          "fadeDim, 1, 4, fluent_decel"
          "border, 1, 2.7, easeOutCirc"
          "borderangle, 1, 30, fluent_decel, once"
          "workspaces, 1, 4, easeOutCubic, fade"
        ];
      };

      # no comsume the shortkey
      bindn = [
        # open the shala dictionary
        "ALT, Q, execr, nu -e floorp_shala_query"
      ];

      bindel = [
        # media and volume controls
        # fn-f11/f12
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
        # laptop brigthness
        # win-[-/+]
        "$mainMod, KP_Add, exec, brightnessctl set 2%+"
        "$mainMod, KP_Subtract, exec, brightnessctl set 2%-"
        "$mainMod, XF86MonBrightnessUp, exec, brightnessctl set 2%+"
        "$mainMod, XF86MonBrightnessDown, exec, brightnessctl set 2%-"
      ];

      bind = [
        # toggle floating
        "$mainMod, mouse:274, togglefloating"

        # terminal
        "$mainMod, Return, exec, alacritty"

        # browser
        "$mainMod, B, exec, floorp"

        # fuzzel
        "$mainMod, Tab, exec, pkill fuzzel || fuzzel --show drun"

        # kill process
        "$mainMod, Q, killactive,"
        "$mainMod, W, closewindow"

        # grave -> `
        "ALT, grave, execr, nu -e toggle_wechat"

        "$mainMod, F11, fullscreen, 0"
        "$mainMod, F12, fullscreen, 1"
        ", F11, fullscreen, 0"
        # ", F12, fullscreen, 1"

        # switch focus
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Screenshot
        ", Print, exec, grimshot copy area"

        # window control
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"

        "$mainMod CTRL, left, resizeactive, -40 0"
        "$mainMod CTRL, right, resizeactive, 40 0"
        "$mainMod CTRL, up, resizeactive, 0 -40"
        "$mainMod CTRL, down, resizeactive, 0 40"
        "$mainMod CTRL, H, resizeactive, -40 0"
        "$mainMod CTRL, L, resizeactive, 40 0"
        "$mainMod CTRL, K, resizeactive, 0 -40"
        "$mainMod CTRL, J, resizeactive, 0 40"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"

        # use `wev` or `showkey` find the keycode
        ", XF86AudioPrev, execr, hyprctl dispatch sendshortcut CTRL, left,  class:yesplaymusic"
        ", XF86AudioNext, execr, hyprctl dispatch sendshortcut CTRL, right, class:yesplaymusic"
        ", XF86AudioPlay,execr, hyprctl dispatch sendshortcut CTRL, P, class:yesplaymusic"

        "CTRL SHIFT, KP_6, execr, hyprctl dispatch sendshortcut CTRL, left,  class:yesplaymusic"
        "CTRL SHIFT, KP_4, execr, hyprctl dispatch sendshortcut CTRL, right, class:yesplaymusic"
        "CTRL SHIFT, KP_8, execr, hyprctl dispatch sendshortcut CTRL, up,  class:yesplaymusic"
        "CTRL SHIFT, KP_2, execr, hyprctl dispatch sendshortcut CTRL, down, class:yesplaymusic"
        "CTRL SHIFT, KP_5, execr, hyprctl dispatch sendshortcut CTRL, P,     class:yesplaymusic"
        # love
        "CTRL SHIFT, KP_Add, execr, hyprctl dispatch sendshortcut CTRL, L,     class:yesplaymusic"
        # minimize
        "CTRL SHIFT, KP_Subtract, execr, hyprctl dispatch sendshortcut CTRL, M,     class:yesplaymusic"
      ];

      # windowrule
      windowrule = [
        "float,imv"
        "center,imv"
        "size 1200 725,imv"
        "float,mpv"
        "center,mpv"
        "size 1200 725,mpv"
        "idleinhibit focus,mpv"

        "pin,fuzzel"
        "float,fuzzel"
        "noborder,fuzzel"
      ];

      # windowrulev2
      windowrulev2 = [
        "float, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(.*imv.*)$"
        "opacity 1.0 override 1.0 override, title:^(.*mpv.*)$"
        "idleinhibit focus, class:^(mpv)$"

        "float, class:^(file_progress)$"
        "float, class:^(confirm)$"
        "float, class:^(dialog)$"
        "float, class:^(download)$"
        "float, class:^(notification)$"
        "float, class:^(error)$"
        "float, class:^(confirmreset)$"
        "float, title:^(Open File)$"
        "float, title:^(Confirm to replace files)$"
        "float, title:^(File Operation Progress)$"

        # use the script to make the window floating.
        "idleinhibit focus, title:.*沙拉.*"
        "opacity 1.0 override 1.0 override, title:.*沙拉.*"

        "float, title:Fcitx Configuration"
        "noborder, title:Fcitx Configuration"
        "size 1000 650, title:Fcitx Configuration"
        "opacity 1.0 1.0, title:Fcitx Configuration"

        "float, initialclass:wechat"
        "noborder, initialclass:wechat"
        "opacity 1.0 override 1.0 override, initialclass:wechat"
        "size 1000 750, initialtitle:微信"
        "idleinhibit focus, initialtitle:微信"
      ];

    };

    extraConfig = ''
      # monitor=eDP-1, disable
      # monitor=Unknown-1, disable # not for sure why this monistor exists
      monitor=,preferred, auto, 1
      # monitor=,preferred, auto, 1 # don't scale
      xwayland {
        force_zero_scaling = true
      }
    '';
  };

}
