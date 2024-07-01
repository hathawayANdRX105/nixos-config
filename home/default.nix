{ inputs, config, pkgs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };

    users.b111011l = {
      imports = [
        (import ./packages.nix)
        (import ./zsh.nix)
        (import ./starship.nix)
        (import ./bat.nix)
        (import ./git.nix)
        (import ./helix.nix)
        # (import ./gitui.nix)
        (import ./floorp.nix)
        (import ./nekoray.nix)
        (import ./fuzzel.nix)
        (import ./kitty.nix)

        (import ./gtk.nix)
        (import ./waybar)
        (import ./hyprlock.nix)
        (import ./hypridle.nix)
        (import ./hyprland.nix)
      ];

      home.username = "b111011l";
      home.homeDirectory = "/home/b111011l";

      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.b111011l = {
    isNormalUser = true;
    home = "/home/b111011l";
    group = "users";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true; # zsh need to be load by home manager.
  };

  security.sudo.extraRules = [{
    groups = [ "wheel" ];
    commands = [{
      command = "ALL";
      options = [ "NOPASSWD" "SETENV" ];
    }];
  }];

  security.sudo.configFile = ''
    root     ALL=(ALL:ALL)    SETENV: ALL
    %wheel   ALL=(ALL:ALL)    SETENV: ALL
    b111011l ALL=(ALL:ALL)    SETENV: ALL
  '';

  nix.settings.allowed-users = [ "b111011l" ];
  nix.settings.trusted-users = [ "b111011l" ];
}
