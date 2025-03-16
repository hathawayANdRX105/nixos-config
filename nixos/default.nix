# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, options, username, version, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./keymap.nix
  ];

  # Use the systemd-boot EFI boot loader.
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
      # do not need to keep too much generations
      configurationLimit = 20;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

  };

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Easiest to use and most distros use this by default.
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" ];

  # hosts
  # networking.extraHosts = ''
  #   185.199.111.133 raw.githubusercontent.com
  # '';

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

  # i18n.inputMethod = {
  #   enable = true;

  # fcitx5.waylandFrontend = true;
  # fcitx5.addons = let
  #   config.packageOverrides = pkgs: {
  #     fcitx5-rime =
  #       pkgs.fcitx5-rime.override { rimeDataPkgs = [ ./rime-data-flypy ]; };
  #   };
  # in with pkgs; [ fcitx5-rime rime-data fcitx5-chinese-addons ];

  # };

  fonts = {
    enableDefaultPackages = true;
    fontconfig.enable = true;
    fontDir.enable = true;

    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      twemoji-color-font
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      wqy_zenhei
    ];
  };

  # hyprlock unblock
  security.pam.services.hyprlock = { };

  # sudo
  security.sudo.enable = true;

  # enable opengl
  # hardware.graphics.enable = true;
  hardware.graphics.enable = true;
  # hardware.opengl.driSupport = true; # TODO:not support
  # hardware.opengl.driSupport32Bit = true;
  hardware.enableRedistributableFirmware = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-compute-runtime
    intel-media-driver
  ];

  # nvidia
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;

    # prime.offload.enable = true;
    # powerManagement.finegrained = true;
    powerManagement.enable = true;

    nvidiaSettings = false;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = false;

    # if there're occur screen tearing issues then uncomment it.
    # forceFullCompositionPipeline = true;
  };

  # default session for autologin
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;

  # Enable sound.
  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [ git unstable.helix ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent.enable = true;
  # programs.gnupg.agent.enableSSHSupport = true;

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # programs.ssh.startAgent = true;

  # Enable notify
  services.dbus.enable = true;

  # Enable support for Bluetooth
  # cmd -> bluetoothctl
  hardware.bluetooth.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.desktopManager.runXdgAutostartIfNone = true;
  # services.xserver.xkb.layout = "us";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
    };

    # do garbage collection weekly to keep disk usage low
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 15d";
    };

    # ignore git dirty warn
    extraOptions = ''
      warn-dirty = false
    '';
  };

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
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-${version}";
  system.stateVersion = version; # Did you read the comment?
}

