{ config, pkgs, ... }:

{
  imports = [
    ./apps.nix
    ./git.nix
    ./ui.nix
    ./.config/links.nix
    ./terminal.nix

  ];

  

  home.username = "laeeq";
  home.homeDirectory = "/home/laeeq";

  home.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
