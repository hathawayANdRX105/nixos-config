 
# zoxide
source ~/.zoxide.nu

# disable welcome message of nushell
$env.config.show_banner = false


# To launch Hyprland with uwsm
# use `complete` capture the output that found out only contains exit_code
let may_start = uwsm check may-start | complete | $in.exit_code == 0
if $may_start {
  ^uwsm start default
}

# Initialize starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Automatically start zellij
if 'ZELLIJ' not-in ($env | columns) {
  if 'ZELLIJ_AUTO_ATTACH' in ($env | columns) and $env.ZELLIJ_AUTO_ATTACH == 'true' {
    zellij attach -c --config $"($env.MY_HOME_CONFIG_DIR)/zellij/config.kdl" --layout $"($env.MY_HOME_CONFIG_DIR)/zellij/layouts/default.kdl"
  } else {
    zellij --config $"($env.MY_HOME_CONFIG_DIR)/zellij/config.kdl" --layout $"($env.MY_HOME_CONFIG_DIR)/zellij/layouts/default.kdl"
  }
  if 'ZELLIJ_AUTO_EXIT' in ($env | columns) and $env.ZELLIJ_AUTO_EXIT == 'true' {
    exit
  }
}

alias cd = z
alias zos = z os
alias cat = bat
alias code = hx --config $"($env.MY_HOME_CONFIG_DIR)/helix/config.toml"
alias hxos = code ~/.nixos-config
alias toggle_wechat = nu $"($env.MY_HOME_BIN_DIR)/toggle_wechat.nu"

alias l = eza --icons  -a --group-directories-first -1
alias ll = eza --icons  -a --group-directories-first -1 --no-user --long
alias tree = eza --icons --tree --group-directories-first

alias nix-clean = sudo nix-collect-garbage | sudo nix-collect-garbage -d | sudo rm /nix/var/nix/gcroots/auto/* | nix-collect-garbage | nix-collect-garbage -d
alias nix-flake-update = sudo nix flake update --flake ~/.nixos-config# --option substituters "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
alias nix-switch = sudo nixos-rebuild switch --option substituters "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"

alias floorp_shala_query = nu $"($env.MY_HOME_BIN_DIR)/floorp_shala_query.nu"
alias open_file_in_helix = nu $"($env.MY_HOME_BIN_DIR)/open_file_in_helix.nu"
alias reveal_in_yazi     = nu $"($env.MY_HOME_BIN_DIR)/reveal_in_yazi.nu"
