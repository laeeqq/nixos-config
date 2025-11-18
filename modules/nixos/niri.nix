{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  

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
  ];
#   temp disable
#   services.displayManager.defaultSession = lib.mkForce "niri";



}