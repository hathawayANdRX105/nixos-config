 
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

# auto start zellij
# let zellij_is_active = pidof zellij | complete | $in.exit_code == 0 
# if not $zellij_is_active  {
# zellij --config $"($env.HOME_CONFIG_DIR)/zellij/config.kdl"
# }

if 'ZELLIJ' not-in ($env | columns) {
  if 'ZELLIJ_AUTO_ATTACH' in ($env | columns) and $env.ZELLIJ_AUTO_ATTACH == 'true' {
    zellij attach -c --config $"($env.MY_HOME_CONFIG_DIR)/zellij/config.kdl"
  } else {
    zellij --config $"($env.MY_HOME_CONFIG_DIR)/zellij/config.kdl"
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
alias nix-flake-update = sudo nix flake update --flake ~/.nixos-config#
alias nix-switch = sudo nixos-rebuild switch

alias floorp_shala_query = nu $"($env.MY_HOME_BIN_DIR)/floorp_shala_query.nu"
