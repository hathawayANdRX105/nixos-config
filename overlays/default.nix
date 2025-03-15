{ inputs, config, pkgs, lib, system, ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "openssl-1.1.1w" ];

  nixpkgs.overlays = [
    (final: prev: {
      unstable = import inputs.nixpkgs-unstable {
        config.allowUnfree = true;
        localSystem = { inherit system; };
      };
    })

    inputs.hyprpanel.overlay
  ];
}
