# rust
$env.RUSTUP_DIST_SERVER = "https://rsproxy.cn"
$env.RUSTUP_UPDATE_ROOT = "https://rsproxy.cn/rustup"

# editor
$env.EDITOR      = "hx"
$env.SUDO_EDITOR = "hx"
$env.config.buffer_editor = "hx"

# xdg
$env.XDG_DESKTOP_DIR     = "$HOME/Desktop"
$env.XDG_DOCUMENTS_DIR   = "$HOME/Documents"
$env.XDG_DOWNLOAD_DIR    = "$HOME/Downloads"
$env.XDG_MUSIC_DIR       = "$HOME/Music"
$env.XDG_PICTURES_DIR    = "$HOME/Pictures"
$env.XDG_PUBLICSHARE_DIR = "$HOME/Public"
$env.XDG_TEMPLATES_DIR   = "$HOME/Templates"
$env.XDG_VIDEOS_DIR      = "$HOME/Videos"
$env.XDG_SESSION_TYPE    = "wayland"
$env.XDG_CURRENT_DESKTOP = "Hyprland"

# wayland & hyprland
$env.NIXOS_OZONE_WL = "1"
$env.__GL_GSYNC_ALLOWED = "0"
$env.__GL_VRR_ALLOWED = "0"
$env.DISABLE_QT5_COMPAT = "0"
$env.GDK_BACKEND = "wayland"
$env.ANKI_WAYLAND = "1"
$env.DIRENV_LOG_FORMAT = ""
$env.WLR_BACKEND = "gl"
$env.WLR_RENDERER = "gl"
# $env.WLR_DRM_NO_ATOMIC = "1"
$env.QT_AUTO_SCREEN_SCALE_FACTOR = "1"
$env.QT_WAYLAND_DISABLE_WINDOWDECORATION = "1"
$env.QT_QPA_PLATFORM = "xcb"
$env.QT_QPA_PLATFORMTHEME = "qt5ct"
$env.QT_STYLE_OVERRIDE = "kvantum"
$env.MOZ_ENABLE_WAYLAND = "1"
# $env.WLR_NO_HARDWARE_CURSORS = "1"
$env.SDL_VIDEODRIVER = "wayland"
$env.CLUTTER_BACKEND = "wayland"
$env.LIBVA_DRIVER_NAME = "nvidia"
$env.GBM_BACKEND = "nvidia"
$env.__GLX_VENDOR_LIBRARY_NAME = "nvidia"

# starship prompt
$env.STARSHIP_CACHE = $"($env.HOME)/.cache/starship"


# zoxide 
zoxide init nushell | save -f ~/.zoxide.nu

# gitui push & ssh
# $env.SSH_AUTH_SOCK = $"($env.XDG_RUNTIME_DIR)/ssh-agent.socket"
# $env.SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh"
