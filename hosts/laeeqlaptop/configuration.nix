# Edit this configuration file to define what should be installed on
# your system. Help is available in configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: 


let
  lib = pkgs.lib;
in
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/niri.nix
    ../../modules/nixos/ssh.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "laeeqlaptop";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Edmonton";
  i18n.defaultLocale = "en_CA.UTF-8";

  # Sudo
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # Fingerprint
  security.pam.services.login.fprintAuth = lib.mkForce true;
security.pam.services.sudo.fprintAuth = lib.mkForce true;
services.fprintd.enable = true;


  # Lid close lock
  services.logind = {
  lidSwitch = "lock";
  lidSwitchExternalPower = "lock";
  lidSwitchDocked = "ignore";
};





  # X11
  services.xserver.enable = true;

  # GNOME (optional)
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Printing
  services.printing.enable = true;

  # Sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.orca.enable = false;

  users.groups.plugdev = {};

users.users.laeeq = {
  isNormalUser = true;
  description = "Laeeq";
  extraGroups = [ "networkmanager" "wheel" "audio" "plugdev" ];
  shell = pkgs.zsh;
  packages = with pkgs; [];
};


  hardware.enableAllFirmware = true;
  hardware.firmware = [ pkgs.sof-firmware ];

  # Automatic login
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "laeeq";

  # Workaround for GNOME autologin
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Applications
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  # USB autosuspend
  environment.etc."modprobe.d/usb-autosuspend.conf".text = ''
    options usbcore autosuspend=-1
  '';

  boot.kernelParams = [ "usbcore.autosuspend=-1" ];
  boot.kernel.sysctl = { "usbcore.autosuspend" = -1; };

  services.udev.extraRules = ''
    # Disable USB autosuspend
    ACTION=="add", SUBSYSTEM=="usb", ATTR{power/control}="on"
    ACTION=="add", SUBSYSTEM=="usb", TEST=="power/autosuspend", ATTR{power/autosuspend}="-1"

    # Goodix fingerprint reader permissions
    SUBSYSTEM=="usb", ATTR{idVendor}=="27c6", ATTR{idProduct}=="639c", MODE="0660", GROUP="plugdev"
  '';

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Installed system packages
  environment.systemPackages = with pkgs; [
    jdk
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # System state version
  system.stateVersion = "25.05";
}
