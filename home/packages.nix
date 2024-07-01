{ pkgs, ... }: {
  services.flameshot.enable = true;

  home.packages = (with pkgs; [
    kdePackages.dolphin # gui file manager

    # language
    # rust-analyzer
    rustup
    gcc
    gnumake

    # cmdline
    zoxide # cd replace
    yazi # teriminal file manager
    eza # ls replace
    gitui # git terminal gui

    # find 
    fzf
    ripgrep

    imv # image viwer
    mpv # video player

    # desktop
    swww
    yesplaymusic
    # wechat-uos
    #    zed-editor

    hypridle
    openssl

    unzip
    wget
  ]);

}
