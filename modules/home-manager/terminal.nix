{ pkgs, lib, ... }:

{
  # Configure Zsh features
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      update = "sudo nixos-rebuild switch";
    };

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];
  };

  # Set Zsh as the default shell for the user
  home.shell = pkgs.zsh;

  # Ensure Zsh is available as a valid login shell
  environment.systemPackages = with pkgs; [
    zsh
  ];
}
