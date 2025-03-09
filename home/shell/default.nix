{ hostname, config, pkgs, ... }:
let config_path = ../config;
in {
  imports = [ ./workspace.nix ./prompt.nix ];
  programs.nushell = {
    enable = true;
    package = pkgs.unstable.nushell;

    envFile.source = ../config/nushell/env.nu;
    loginFile.source = ../config/nushell/login.nu;
    configFile.source = ../config/nushell/config.nu;

    shellAliases = {
      cd = "z";
      cat = "bat";

      zos = "z os";
      l = "eza --icons  -a --group-directories-first -1";
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # Nixos
      hxos = "hx ~/.nixos-config";
      nix-switch = "sudo nixos-rebuild switch";
      nix-flake-update = "sudo nix flake update ~/nixos-config#";
      nix-clean =
        "sudo nix-collect-garbage and sudo nix-collect-garbage -d and sudo rm /nix/var/nix/gcroots/auto/* and nix-collect-garbage and nix-collect-garbage -d";
    };

  };

  # cd replacement
  programs.zoxide = {
    enable = true;
    package = pkgs.unstable.zoxide;
    enableNushellIntegration = true;
  };

  # cat replacement
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "Dracula";
    };
  };

  # programs.zsh = {
  #   enable = true;
  #   enableCompletion = true;
  #   autosuggestion.enable = true;
  #   syntaxHighlighting.enable = true;
  #   syntaxHighlighting.highlighters =
  #     [ "main" "brackets" "pattern" "cursor" "regexp" "root" "line" ];

  #   oh-my-zsh.enable = true;
  #   oh-my-zsh.plugins = [ "git" "sudo" ];
  #   initExtraFirst = ''
  #     DISABLE_MAGIC_FUNCTIONS=true
  #   '';

  #   shellAliases = {
  #     cd = "z";
  #     cat = "bat";

  #     l = "eza --icons  -a --group-directories-first -1";
  #     ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
  #     tree = "eza --icons --tree --group-directories-first";

  #     # Nixos
  #     hxos = "hx ~/.nixos-config";
  #     nix-switch = "sudo nixos-rebuild switch";
  #     nix-flake-update = "sudo nix flake update ~/nixos-config#";
  #     nix-clean =
  #       "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
  #   };
  # };

}
