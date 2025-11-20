{ config, pkgs, lib, ... }:

{
  # Use Zsh as the default shell
  home.shell = pkgs.zsh;

  # Enable Zsh program
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };
}
