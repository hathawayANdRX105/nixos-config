{ hostname, config, pkgs, ... }: {
  programs.nushell = {
    enable = true;
    package = pkgs.unstable.nushell;
    configFile.text = "\n";

    envFile.text = "";
    shellAliases = {
      cd = "z";
      cat = "bat";

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
}
