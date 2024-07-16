# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, options, username, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nixpkgs.config.permittedInsecurePackages = [ "openssl-1.1.1w" ];
  # Use the systemd-boot EFI boot loader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      extraEntries = ''
            menuentry "Windows" {
        	search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
        	chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
            }
      '';
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

  };

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Easiest to use and most distros use this by default.
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" ];

  # hosts
  networking.extraHosts = ''
    185.199.111.133 raw.githubusercontent.com
  '';

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";
  networking.timeServers = options.networking.timeServers.default
    ++ [ "ntp.ntsc.ac.cn" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  i18n.defaultLocale = "zh_CN.UTF-8";

  i18n.inputMethod = {
    enabled = "fcitx5";

    fcitx5 = {
      addons = with pkgs; [ rime-data fcitx5-rime ];

      waylandFrontend = true;
    };
  };

  fonts = {
    enableDefaultPackages = true;
    fontconfig.enable = true;
    fontDir.enable = true;

    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      twemoji-color-font
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      wqy_zenhei
    ];
  };

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # hyprlock unblock
  security.pam.services.hyprlock = { };

  # sudo
  security.sudo.enable = true;

  # enable opengl
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.enableRedistributableFirmware = true;
  hardware.opengl.extraPackages = with pkgs; [
    intel-compute-runtime
    intel-media-driver
  ];

  # nvidia
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia-dkms" ];
  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;
    powerManagement.finegrained = false;

    nvidiaSettings = false;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = false;
  };

  # default session for autologin
  programs.hyprland.enable = true;

  services.displayManager.autoLogin = {
    enable = true;
    user = "${username}";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ git helix ];

  environment.variables.EDITOR = "helix";
  environment.variables.SUDO_EDITOR = "helix";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # zsh
  programs.zsh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable notify
  services.dbus.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.desktopManager.runXdgAutostartIfNone = true;
  services.xserver.xkb.layout = "us";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # key remap
  services.keyd = {
    enable = true;
    keyboards = {
      # The name is just the name of the configuration file, it does not really matter
      default = {
        ids = [
          "*"
        ]; # what goes into the [id] section, here we select all keyboards
        # Everything but the ID section:
        settings = {
          # The main layer, if you choose to declare it in Nix
          main = {
            capslock = "layer(control)";
            rightalt = "capslock";
          };
        };
      };
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball
      "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
  };

  # allow unfree software
  nixpkgs.config.allowUnfree = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-24.05";
  system.stateVersion = "24.05"; # Did you read the comment?
}

