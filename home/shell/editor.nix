{ config, pkgs, lib, inputs, ... }: {
  programs.helix = {
    enable = true;
    package = pkgs.unstable.helix;
    defaultEditor = true;

    languages = {
      language = [
        { name = "rust"; }
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
        }
      ];

      language-server.rust-analyzer.config.check = { command = "clippy"; };
    };
  };
}
