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

  # home.sessionVariables = {
  #   XDG_DESKTOP_DIR = "$HOME/Desktop";
  #   XDG_DOCUMENTS_DIR = "$HOME/Documents";
  #   XDG_DOWNLOAD_DIR = "$HOME/Downloads";
  #   XDG_MUSIC_DIR = "$HOME/Music";
  #   XDG_PICTURES_DIR = "$HOME/Pictures";
  #   XDG_PUBLICSHARE_DIR = "$HOME/Public";
  #   XDG_TEMPLATES_DIR = "$HOME/Templates";
  #   XDG_VIDEOS_DIR = "$HOME/Videos";
  # };
}
