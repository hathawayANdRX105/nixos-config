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
    gnuplot
    wl-clipboard # fix the copy&paste disfunction in helix
    brightnessctl # adjust the brightness of screen
    # lshw # nvidia prime:show the configuration of Bus ID value

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
    # wechat-uos # wechat
    # p3x-onenote # onenote for linux

    unzip
    wget

    xdg-user-dirs # a tool to help manage user directories
  ]);
}
