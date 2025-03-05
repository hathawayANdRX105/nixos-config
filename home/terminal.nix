{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    themeFile = "shadotheme";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };

  };
}
