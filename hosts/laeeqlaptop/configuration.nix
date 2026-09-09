{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/niri.nix
    ../../modules/nixos/ssh.nix
  ];

  services.tailscale.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "laeeqlaptop";
  networking.networkmanager.enable = true;

  # Locale
  time.timeZone = "America/Edmonton";
  i18n.defaultLocale = "en_CA.UTF-8";

  # Sudo
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # Printing
  services.printing.enable = true;

  boot.supportedFilesystems = [ "ntfs" ];

  services.openssh.enable = true;

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.mysql = {
    enable = true;
    package = pkgs.mysql84;
  };

  #   # qBittorrent as a systemd service
  # services.qbittorrent-nox = {
  #   enable = true;
  #   user = "yourusername"; # replace with your username
  #   webUi = {
  #     enable = true;
  #     port = 8080;          # default web UI port
  #   };
  # };

  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "ignore";
    lidSwitchDocked = "ignore";
  };

  services.orca.enable = false;

  # User
  users.users.laeeq = {
    isNormalUser = true;
    description = "Laeeq";
    extraGroups = [ "networkmanager" "wheel" "audio" "docker" ];
    shell = pkgs.zsh;
  };

  # Enable Docker service
  virtualisation.docker.enable = true;

  # Firmware
  hardware.enableAllFirmware = true;
  hardware.firmware = [ pkgs.sof-firmware ];

  # Auto login
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "laeeq";

  # Display manager (GDM)
  services.displayManager.gdm.enable = true;


  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Apps
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  # Nix
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    jdk
  ];

  system.stateVersion = "25.05";

  boot.loader.systemd-boot.configurationLimit = 4;
}