{ pkgs, ... }:
{
   home.packages = (with pkgs; [
    kdePackages.dolphin # gui file manager
    
    gcc
    gnumake

    # cmdline
    zoxide   # cd replace
    yazi     # teriminal file manager

    # find 
    fzf
    ripgrep

    imv # image viwer
    mpv # video player

    # desktop
    swww

    hypridle
#    zed-editor
    
    unzip
    wget
  ]);
}
