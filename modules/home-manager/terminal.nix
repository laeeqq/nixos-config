{
  pkgs,
  system,
  lib,
  ...
}: {

  # ------------------------
  # Zsh + Starship + utilities
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
      sleep = "systemctl suspend" ;
    };

    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      ignorePatterns = [ "rm *" "pkill *" "cp *" ];
    };

    initContent = ''
      export STARSHIP_CONFIG="$HOME/.config/ghostty/starship.toml"
    '';
  };

  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;

  programs.atuin.enable = true;
  programs.atuin.enableZshIntegration = true;

  programs.carapace.enable = true;
  programs.carapace.enableZshIntegration = true;

  # ------------------------
  # Packages
  # ------------------------
  home.packages = with pkgs; [
    ghostty
  ];

  # ------------------------
  # Session variables
  # ------------------------
  home.sessionVariables = {
    GHOSTTY_CONFIG = "$HOME/.config/ghostty/config.toml";
  };

  # ------------------------
  # Ghostty
  # ------------------------
  programs.ghostty.enable = true;
}
