 
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
let zellij_is_active = pidof zellij | complete | $in.exit_code == 0 
if not $zellij_is_active  {
  zellij
}
