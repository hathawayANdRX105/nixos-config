
{ config, pkgs, ...} :
{
  programs.kitty = {
    enable = true;
    theme = "shadotheme";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };

    shellIntegration.enableZshIntegration = true;
  };
}
