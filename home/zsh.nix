{ hostname, config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters =
        [ "main" "brackets" "pattern" "cursor" "regexp" "root" "line" ];
    };

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };

    initExtraFirst = ''
      DISABLE_MAGIC_FUNCTIONS=true
    '';

    shellAliases = {
      # Utils
      c = "clear";
      cd = "z";
      cat = "bat";

      l = "eza --icons  -a --group-directories-first -1"; # EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # Python3
      py = "python3";

      # Nixos
      hxos = "sudo hx /etc/nixos -c ~/.config/helix/config.toml";
      nix-switch = "sudo nixos-rebuild switch";
      nix-flake-update = "sudo nix flake update ~/nixos-config#";
      nix-clean =
        "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
