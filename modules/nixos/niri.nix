{
  pkgs,
  lib,
  inputs,
  system,
  ...
}: {
  # Disable problematic documentation builds
  documentation = {
    enable = false;
    man.enable = false;
    info.enable = false;
    dev.enable = false;
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    alacritty
    rofi
    zsh
    nodejs
    ghostty
    typescript
    pavucontrol
    openjdk
    pulseaudio
    swaylock-effects
    fprintd
    grim
    slurp
    jetbrains-toolbox
    evince
    nmap
    awscli
    vim
    openvpn
    wireshark

    # Python
    (python312.withPackages (ps: with ps; [
      numpy
      pandas
      boto3
    ]))
  ];

  services.displayManager.defaultSession = lib.mkForce "niri";
}