{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    ohMyZsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
      ];
    };
  };

  home.shell = pkgs.zsh;

  home.sessionVariables = {
    EDITOR = "nano";
    PAGER  = "less";
  };
}
