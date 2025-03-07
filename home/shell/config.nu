 
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
