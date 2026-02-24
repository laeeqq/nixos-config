{ pkgs, system, lib, ... }:

{
  # ------------------------
  # Zsh
  # ------------------------
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      rebuild = "${pkgs.nh}/bin/nh os switch ~/nixos";
      ls = "ls --color=auto";
      sleep = "systemctl suspend";
    };

    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      ignorePatterns = [ "rm *" "pkill *" "cp *" ];
    };

    initExtra = ''
      export STARSHIP_CONFIG="$HOME/.config/ghostty/starship.toml"

      # completion system (needed for carapace)
      autoload -Uz compinit
      compinit
    '';
  };

  # ------------------------
  # Starship
  # ------------------------
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # ------------------------
  # Zoxide
  # ------------------------
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # ------------------------
  # Atuin
  # ------------------------
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  # ------------------------
  # Carapace
  # ------------------------
  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
  };

  # ------------------------
  # Ghostty
  # ------------------------
  programs.ghostty.enable = true;

  # ------------------------
  # Packages
  # ------------------------
  home.packages = with pkgs; [
  ];
}
