# configuration.nix
{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/niri.nix
    ../../modules/nixos/ssh.nix

  ];

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

  
  # X11 + GNOME (you are still using these)
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
  };

  # Printing
  services.printing.enable = true;

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
    package = pkgs.mysql80;
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
  lidSwitchExternalPower = "suspend";
  lidSwitchDocked = "ignore";
};

  services.orca.enable = false;

  # User
  users.users.laeeq = {
    isNormalUser = true;
    description = "Laeeq";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    shell = pkgs.zsh;
  };

  # Firmware
  hardware.enableAllFirmware = true;
  hardware.firmware = [ pkgs.sof-firmware ];

  # Auto login
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "laeeq";

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Apps
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  # # USB autosuspend (safe to keep)
  # environment.etc."modprobe.d/usb-autosuspend.conf".text = ''
  #   options usbcore autosuspend=-1
  # '';

  # boot.kernelParams = [ "usbcore.autosuspend=-1" ];
  # boot.kernel.sysctl = {
  #   "usbcore.autosuspend" = -1;
  # };

  # services.udev.extraRules = ''
  #   ACTION=="add", SUBSYSTEM=="usb", ATTR{power/control}="on"
  #   ACTION=="add", SUBSYSTEM=="usb", TEST=="power/autosuspend", ATTR{power/autosuspend}="-1"
  # '';

  # Nix
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  environment.systemPackages = with pkgs; [
    jdk
  ];

  system.stateVersion = "25.05";


}
