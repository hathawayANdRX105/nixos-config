{ inputs, config, pkgs, username, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };

    users.${username} = {
      imports = [
        (import ./packages.nix)
        (import ./zsh.nix)
        (import ./starship.nix)
        (import ./bat.nix)
        (import ./git.nix)
        (import ./helix.nix)

        (import ./fuzzel.nix)
        (import ./kitty.nix)

        (import ./gtk.nix)
        (import ./waybar)
        (import ./hyprlock.nix)
        (import ./hypridle.nix)
        (import ./hyprland.nix)
      ];

      home.username = "${username}";
      home.homeDirectory = "/home/${username}";

      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    home = "/home/${username}";
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
    ${username} ALL=(ALL:ALL)    SETENV: ALL
  '';

  nix.settings.allowed-users = [ "${username}" ];
  nix.settings.trusted-users = [ "${username}" ];
}
