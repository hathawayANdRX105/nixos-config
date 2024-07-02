{ pkgs, ... }: {
  home.packages = (with pkgs; [
    slurp
    grim
    sway-contrib.grimshot

    # language
    rustup # rust toolchain install rust-src | rust-analyzer
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
    swww # wallpaper
    yesplaymusic # music player
    floorp # browser
    nekoray # proxy
    # wechat-uos
    # zed-editor

    hypridle
    openssl

    unzip
    wget
  ]);

}
