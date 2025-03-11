{ hostname, config, pkgs, ... }:
let config_path = ../config;
in {
  imports = [ ./prompt.nix ./editor.nix ./git.nix ./file_manager.nix ];
  programs.nushell = {
    enable = true;
    package = pkgs.unstable.nushell;

    envFile.source = ../config/nushell/env.nu;
    loginFile.source = ../config/nushell/login.nu;
    configFile.source = ../config/nushell/config.nu;
  };

  # cd replacement
  programs.zoxide = {
    enable = true;
    # need high version to fix initialize error
    package = pkgs.unstable.zoxide;
  };

  # workspace
  programs.zellij.enable = true;

  # cat replacement
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "Dracula";
    };
  };
}
