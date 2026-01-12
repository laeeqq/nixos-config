{
  pkgs,
  lib,
  inputs,
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
    ghostty
    zsh
    nodejs
    typescript
    pavucontrol
    openjdk
    nh
    pulseaudio
    swaylock-effects
    fprintd
    grim
    slurp 
    jetbrains-toolbox
    evince
    python311
    

    
    
  ];

  services.displayManager.defaultSession = lib.mkForce "niri";
}
