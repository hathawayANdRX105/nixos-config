{ pkgs, inputs, ... }: {
  home.packages = (with pkgs; [
    # screenshot
    slurp
    grim
    sway-contrib.grimshot

    # language
    unstable.rustup # rust toolchain install rust-src | rust-analyzer
    gcc
    gnumake

    # cmdline
    eza # ls replace
    # matugen # theme color generation tool
    # gnuplot # draw ploter
    playerctl # media controller
    wl-clipboard # fix the copy&paste disfunction in helix
    brightnessctl # adjust the brightness of screen

    wluma
    # the brightness of wayland controller commandline tool
    # `ddcutil environment` to find the problems
    # it usually need permission, then remember add `sudo`.
    ddcutil

    bluez
    bluez-alsa
    bluez-tools

    # find 
    fzf
    ripgrep

    wev # wayland event viewer find keycode
    imv # image viwer
    mpv # video player
    xdg-desktop-portal-hyprland

    # desktop
    swww # wallpaper
    yesplaymusic # music player
    floorp # browser
    nekoray # proxy
    wechat-uos # wechat
    p3x-onenote # onenote for linux
    # obsidian

    unzip
    wget

    xdg-user-dirs # a tool to help manage user directories
  ]);
}
