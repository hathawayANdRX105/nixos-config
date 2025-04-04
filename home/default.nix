{ inputs, config, pkgs, username, ... }:
let homeVersion = "25.05";
in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };

    # backup bug fix: use the below cmd to delete the backup file
    # journalctl -xe --unit home-manager-{username}
    backupFileExtension = "backup";

    users.${username} = {
      imports = [
        (import ./packages.nix)

        (import ./app_launcher.nix)
        (import ./terminal.nix)

        # (import ./gtk.nix)
        (import ./shell)
        (import ./status_bar.nix)
        (import ./system_standby.nix)
        (import ./desktop_environment.nix)

      ];

      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = homeVersion;
      programs.home-manager.enable = true;
      home.enableNixpkgsReleaseCheck = false;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    home = "/home/${username}";
    group = "users";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.unstable.nushell;
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

  security.pam.services.${username}.sshAgentAuth = true;
}
