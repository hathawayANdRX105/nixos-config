# rust
$env.RUSTUP_DIST_SERVER = "https://rsproxy.cn"
$env.RUSTUP_UPDATE_ROOT = "https://rsproxy.cn/rustup"

# editor
$env.EDITOR      = "hx"
$env.SUDO_EDITOR = "hx"
$env.config.buffer_editor = "hx"

# xdg
$env.XDG_DESKTOP_DIR     = $"($env.HOME)/Desktop"
$env.XDG_DOCUMENTS_DIR   = $"($env.HOME)/Documents"
$env.XDG_DOWNLOAD_DIR    = $"($env.HOME)/Downloads"
$env.XDG_MUSIC_DIR       = $"($env.HOME)/Music"
$env.XDG_PICTURES_DIR    = $"($env.HOME)/Pictures"
$env.XDG_PUBLICSHARE_DIR = $"($env.HOME)/Public"
$env.XDG_TEMPLATES_DIR   = $"($env.HOME)/Templates"
$env.XDG_VIDEOS_DIR      = $"($env.HOME)/Videos"
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
$env.config.render_right_prompt_on_last_line = true

# zoxide 
zoxide init nushell | save -f ~/.zoxide.nu

# this path contain all the configuration file setup by home-manager
$env.HOME_CONFIG_DIR = $"($env.HOME)/.nixos-config/home/config"
