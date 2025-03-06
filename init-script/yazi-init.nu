# yazi initlize theme and some plugins.
do -i {
  ya pack -a BennyOe/tokyo-night
  | ya pack -a h-hg/yamb
  | ya pack -a yazi-rs/plugins:full-border
  | ya pack -a yazi-rs/plugins:no-status
  | ya pack -a yazi-rs/plugins:toggle-pane;
}
