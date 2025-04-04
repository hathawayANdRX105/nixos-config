# Change the configuration directory
use the soft link setup configuration directory which having a normal user easy way to change configuration without using root authority. 
> # backup the hardware-configuration.nix before running the command 
> 1. sudo rm -r /etc/nixos
> 2. sudo ln -s ~/.nixos-config /etc/nixos


# Initialize configuration or plugin in shell
There're some scrpt which need to run once in `init-scprit` dir.


# Fcitx5 using ALT-SHIFT-J/H hotkey
add-on 选项中找到Input Methond删除默认键盘的 'ALT-SHITF-J' 快捷键


# Git clone problem | sparse clone
`git clone --depth 1 --filter=blob:none --sparse git@github.com:yazi-rs/plugins.git`

`git sparse-checkout init --cone`

`git sparse-checkout set "dirname"`

# nix fetch from github `rev` & `hash`
nix-prefetch-github owner repo
