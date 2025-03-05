{ config, ... }: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
      };

      listener = [
        {
          timeout = 250;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 255;
          on-timeout = "brightnessctl -sd dell::kbd_backlight set 0";
          on-resume = "brightnessctl -rf dell::kbd_backlight";
        }
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 600;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
