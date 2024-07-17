{ pkgs, inputs, ... }: {

  home.packages = (with pkgs; [
    # screenshot
    slurp
    grim
    sway-contrib.grimshot

    # language
    rustup # rust toolchain install rust-src | rust-analyzer
    gcc
    gnumake
    python312
    python312Packages.python-lsp-server

    # cmdline
    zoxide # cd replace
    yazi # teriminal file manager
    eza # ls replace
    gitui # git terminal gui

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

    unzip
    wget

    xdg-user-dirs # a tool to help manage user directories
  ]);

  home.sessionVariables = {
    XDG_DESKTOP_DIR = "$HOME/Desktop";
    XDG_DOCUMENTS_DIR = "$HOME/Documents";
    XDG_DOWNLOAD_DIR = "$HOME/Downloads";
    XDG_MUSIC_DIR = "$HOME/Music";
    XDG_PICTURES_DIR = "$HOME/Pictures";
    XDG_PUBLICSHARE_DIR = "$HOME/Public";
    XDG_TEMPLATES_DIR = "$HOME/Templates";
    XDG_VIDEOS_DIR = "$HOME/Videos";
  };
}
