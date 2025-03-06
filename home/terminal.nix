{ config, pkgs, ... }: {
  # programs.kitty = {
  #   enable = true;
  #   themeFile = "shadotheme";
  #   font = {
  #     name = "JetBrainsMono Nerd Font";
  #     size = 14;
  #   };
  # };

  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.decorations = "None";
    font.normal.family = "JetBrainsMono Nerd Font";
    font.size = 14;
    terminal.osc52 = "CopyPaste"; # clipboard copy and paste
    selection.save_to_clipboard = true;
    keyboard.bindings = [
      {
        key = "c";
        mods = "Control|Shift";
        action = "Copy";
      }
      {
        key = "v";
        mods = "Control|Shift";
        action = "Paste";
      }
      {
        key = "ArrowUp";
        mods = "Control|Shift";
        action = "ScrollLineUp";
      }
      {
        key = "ArrowDown";
        mods = "Control|Shift";
        action = "ScrollLineDown";
      }
    ];

    # tokyo_night_enhanced
    colors.cursor.cursor = "#787c99";
    colors.primary = {
      background = "#08080b";
      foreground = "#787c99";
    };
    colors.selection = {
      text = "CellForeground";
      background = "#515c7e";
    };
    colors.normal = {
      black = "#363b54";
      red = "#f7768e";
      green = "#41a6b5";
      yellow = "#e0af68";
      blue = "#7aa2f7";
      magenta = "#bb9af7";
      cyan = "#7dcfff";
      white = "#787c99";
    };
    colors.bright = {
      black = "#363b54";
      red = "#f7768e";
      green = "#41a6b5";
      yellow = "#e0af68";
      blue = "#7aa2f7";
      magenta = "#bb9af7";
      cyan = "#7dcfff";
      white = "#787c99";
    };
  };
}
