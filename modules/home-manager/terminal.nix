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
      # ------------------------
      # Source Home Manager environment
      # ------------------------
      if [ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
        source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      fi

      # ------------------------
      # Starship config
      # ------------------------
      export STARSHIP_CONFIG="$HOME/.config/ghostty/starship.toml"

      # ------------------------
      # Zsh completion system (needed for Carapace, Atuin, Zoxide)
      # ------------------------
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
  # Home packages
  # ------------------------
  home.packages = with pkgs; [
    # Add packages here if needed
  ];
}