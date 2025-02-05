{ config, pkgs, ... }: {
  home.packages = with pkgs; [ wayland ];

  #systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      "$mainMod" = "SUPER";

      exec-once = [
        "fcitx5 &"
        "hypridle &"
        "swww-daemon && swww img /etc/nixos/wallpaper/miku.jpg &"
        "waybar &"
        # "hyprctl setcursor Bibata-Modern-Ice 24 &"

        "[workspace 5 silent] yesplaymusic"
        "[workspace 5 silent] nekoray"
        "[workspace 2 silent] wechat-uos"
        # "[workspace 3 silent] floorp 'https://leetcode.cn/'"
        # "[workspace 3 silent] p3x-onenote"
        "[workspace 1 silent] kitty"
        "[workspace 1 silent] floorp"
        "sleep 5 && hyprctl dispatch workspace 1" # lastly focus workspace 1
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
        no_gaps_when_only = true;
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      decoration = {
        rounding = 5;

        active_opacity = 0.98;
        inactive_opacity = 0.98;

        dim_inactive = true;
        dim_strength = 7.5e-2;

        blur.enabled = false;
        drop_shadow = false;
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

      # use wev find the keycode
      bindn = [
        ", code:173 ,execr, hyprctl dispatch sendshortcut CTRL, left,  class:yesplaymusic"
        ", code:171 ,execr, hyprctl dispatch sendshortcut CTRL, right, class:yesplaymusic"
        ", code:172 ,execr, hyprctl dispatch sendshortcut CTRL, P,     class:yesplaymusic"
        ", code:174 ,execr, hyprctl dispatch sendshortcut CTRL, L,     class:yesplaymusic"
        ", code:179 ,execr, hyprctl dispatch sendshortcut CTRL, M,     class:yesplaymusic"
      ];

      bind = [
        # terminal
        "$mainMod, Return, exec, kitty"

        # browser
        "$mainMod, B, exec, floorp"

        # browser
        "$mainMod, E, exec, dolphin"

        # fuzzel
        "$mainMod, Tab, exec, pkill fuzzel || fuzzel --show drun"

        "$mainMod, Q, killactive,"

        "$mainMod, F11, fullscreen, 0"
        "$mainMod, F12, fullscreen, 1"

        # switch focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # "CTRL, T, pass, class:floorp"
        # "Control_L&Alt_L, left,  fullscreen, 0"
        # "CTRL, up, fullscreen, 0"
        # "CTRL, left,  pass, ^(.*yesplaymusic)$"
        # "CTRL, right, pass, ^(.*YesPlayMusic)$"
        # "CTRL, down,  pass, ^(.*YesPlayMusic)$"

        # Screenshot
        ", Print, exec, grimshot copy area"

        # media and volume controls
        ",XF86AudioRaiseVolume,exec, pactl set-sink-volume @DEFAULT_SINK@ +2%"
        ",XF86AudioLowerVolume,exec, pactl set-sink-volume @DEFAULT_SINK@ -2%"

        # laptop brigthness
        ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"

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

        "$mainMod ALT, left, moveactive,  -80 0"
        "$mainMod ALT, right, moveactive, 80 0"
        "$mainMod ALT, up, moveactive, 0 -80"
        "$mainMod ALT, down, moveactive, 0 80"
        "$mainMod ALT, H, moveactive,  -80 0"
        "$mainMod ALT, L, moveactive, 80 0"
        "$mainMod ALT, K, moveactive, 0 -80"
        "$mainMod ALT, J, moveactive, 0 80"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
      ];

      # windowrule
      windowrule = [
        "float,imv"
        "center,imv"
        "size 1200 725,imv"
        "float,mpv"
        "center,mpv"
        "size 1200 725,mpv"
        "float,title:^(float_kitty)$"
        "center,title:^(float_kitty)$"
        "size 950 600,title:^(float_kitty)$"
        "float,audacious"
        "workspace 8 silent, audacious"
        "pin,fuzzel"
        "float,fuzzel"
        "noborder,fuzzel"
        "idleinhibit focus,mpv"
        "float,wechat-uos"
        "size 900 700,class:wechat"
        "float,udiskie"
        "float,title:^(Transmission)$"
        "float,title:^(Volume Control)$"
        "float,title:^(Firefox — Sharing Indicator)$"
        "move 0 0,title:^(Firefox — Sharing Indicator)$"
        "size 700 450,title:^(Volume Control)$"
        "move 40 55%,title:^(Volume Control)$"
      ];

      # windowrulev2
      windowrulev2 = [
        "float, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(.*imv.*)$"
        "opacity 1.0 override 1.0 override, title:^(.*mpv.*)$"
        "opacity 1.0 override 1.0 override, class:(Aseprite)"
        "opacity 1.0 override 1.0 override, class:(Unity)"
        "opacity 0.9 0.9,title:^(kitty)$"
        "opacity 0.9 0.9,class:^(kitty)$"
        "opacity 0.9 0.9,title:^(.*YesPlayMusic.*)$"
        "opacity 0.98 override 0.98 override, title:^(floorp)$"
        "opacity 0.98 override 0.98 override, class:^(floorp)$"
        "idleinhibit focus, class:^(mpv)$"
        "idleinhibit fullscreen, class:^(floorp)$"
        "float,class:^(pavucontrol)$"
        "float,class:^(SoundWireServer)$"
        "float,class:^(.sameboy-wrapped)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"
      ];

    };

    extraConfig = ''
      monitor=eDP-1, disable
      monitor=Unknown-1, disable # not for sure why this monistor exists
      monitor=,preferred, auto, 1
      # monitor=,preferred, auto, 1 # don't scale
      xwayland {
        force_zero_scaling = true
      }
    '';
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    DISABLE_QT5_COMPAT = "0";
    GDK_BACKEND = "wayland";
    ANKI_WAYLAND = "1";
    DIRENV_LOG_FORMAT = "";
    WLR_DRM_NO_ATOMIC = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "kvantum";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";

    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };

}
