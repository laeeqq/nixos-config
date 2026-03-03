{
  pkgs,
  lib,
  inputs,
  system,
  ...
}: {
  # Enable Niri
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    # package = inputs.niri.packages.${pkgs.system}.niri;
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
  python311
  nmap
  awscli
  python3Packages.boto3
  vim
  openvpn
  wireshark

  # Add these Python packages
  python3Packages.numpy
  python3Packages.pandas
  python3Packages.spacy
  python3Packages.torch
];


  



  services.displayManager.defaultSession = lib.mkForce "niri";
}
