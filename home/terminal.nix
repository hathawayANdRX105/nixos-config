{ config, pkgs, ... }: {
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.decorations = "None";
    font.normal.family = "LXGW WenKai Mono";
    font.size = 16;
    terminal.osc52 = "CopyPaste"; # clipboard copy and paste
    selection.save_to_clipboard = true;
    keyboard.bindings = [
      # disable vi mode
      {
        key = "Space";
        mods = "Shift|Control";
        mode = "~Search";
        action = "none";
      }
      {
        key = "Space";
        mods = "Shift|Control";
        mode = "~Search";
        action = "none";
      }
      # disable search mode
      {
        key = "F";
        mods = "Control|Shift";
        mode = "~Search";
        action = "none";
      }
      {
        key = "B";
        mods = "Control|Shift";
        mode = "~Search";
        action = "none";
      }

    ];
  };
}
