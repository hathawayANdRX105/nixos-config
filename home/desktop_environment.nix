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
        "[workspace 5 ] wechat-uos"
        "[workspace 1 silent] floorp"
        "[workspace 2 silent] alacritty"
        "[workspace 3 silent] yesplaymusic"
        "[workspace 4 silent] nekoray"
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
        gaps_out = 0;
        border_size = 0;
        no_border_on_floating = true;
        resize_on_border = true;
        extend_border_grab_area = 15;

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
        force_split = 2;
        special_scale_factor = 1.0;
        use_active_for_splits = true;
        pseudotile = true;
      };

      decoration = {
        rounding = 0;

        active_opacity = 0.93;
        inactive_opacity = 0.93;

        dim_inactive = false;
        blur.enabled = false;
        shadow.enabled = false;
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"

          "easeInOutExpo, 0.87, 0, 0.13, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
        ];

        animation = [
          # Windows
          "windowsIn, 1, 3, easeOutExpo, popin 30%"
          "windowsOut, 1, 3, fluent_decel, popin, 80%"
          "windowsMove, 1, 2, easeInOutExpo, slide"

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
        # monitor's brigthness
        # win-[-/+]
        "$mainMod, KP_Add, exec, sudo ddcutil setvcp 10 + 2"
        "$mainMod, KP_Subtract, exec, sudo ddcutil setvcp 10 - 2"
        "$mainMod, XF86MonBrightnessUp, exec, sudo ddcutil setvcp 10 + 2"
        "$mainMod, XF86MonBrightnessDown, exec, sudo ddcutil setvcp 10 - 2"
      ];

      bindr = [
        # use `wev` or `showkey` find the keycode
        ", XF86AudioPrev, execr, playerctl next"
        ", XF86AudioNext, execr, playerctl previous"
        ", XF86AudioPlay, execr, playerctl play-pause"

        "Control_L&ALT_L, KP_4, sendshortcut, CTRL, Left, class:yesplaymusic"
        "Control_L&ALT_L, KP_6, sendshortcut, CTRL, Right, class:yesplaymusic"
        "Control_L&ALT_L, KP_8, sendshortcut, CTRL, Up, class:yesplaymusic"
        "Control_L&ALT_L, KP_2, sendshortcut, CTRL, Down, class:yesplaymusic"
        "Control_L&ALT_L, KP_5, sendshortcut, CTRL, P, class:yesplaymusic"

        "Control_L&ALT_L, KP_Left, sendshortcut, CTRL, Left, class:yesplaymusic"
        "Control_L&ALT_L, KP_Right,  sendshortcut, CTRL, Right, class:yesplaymusic"
        "Control_L&ALT_L, KP_Up,    sendshortcut, CTRL, Up, class:yesplaymusic"
        "Control_L&ALT_L, KP_Down,  sendshortcut, CTRL, Down, class:yesplaymusic"
        "Control_L&ALT_L, KP_Begin, sendshortcut, CTRL, P, class:yesplaymusic"

        # love
        "Control_L&ALT_L, KP_ADD, sendshortcut, CTRL, L, class:yesplaymusic"
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
        "$mainMod, Q, killactive"
        "$mainMod, W, closewindow"

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
        # grave -> `
        # "ALT, grave, execr, nu -e toggle_wechat"
        "ALT, grave, workspace, 5"
        ", F1, workspace, 1"
        ", F2, workspace, 2"
        ", F3, workspace, 3"
        ", F4, workspace, 4"
        ", F5, workspace, 5"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod , F1, movetoworkspace, 1"
        "$mainMod , F2, movetoworkspace, 2"
        "$mainMod , F3, movetoworkspace, 3"
        "$mainMod , F4, movetoworkspace, 4"
        "$mainMod , F5, movetoworkspace, 5"
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

        "opacity 1.0 override 1.0 override, steam"
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

        "float, class:org.fcitx."
        "noborder, class:org.fcitx."
        "opacity 1.0 override 1.0 override, class:org.fcitx."
        "size 1000 650, initialtitle:Fcitx Configuration"

        # "float, initialclass:wechat"
        # "noborder, initialclass:wechat"
        "opacity 1.0 override 1.0 override, initialclass:wechat"
        # "size 1000 750, initialtitle:微信"
        # "idleinhibit focus, initialtitle:微信"
      ];

    };

    extraConfig = ''
      monitor=eDP-1, disable
      # monitor=Unknown-1, disable # not for sure why this monistor exists
      monitor=HDMI-A-1,preferred, auto, 1
      # monitor=,preferred, auto, 1 # don't scale
      xwayland {
        force_zero_scaling = true
      }
    '';
  };

}
