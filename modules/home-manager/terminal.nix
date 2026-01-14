{
  pkgs,
  system,
  lib,
  ...
}: {
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
    };

    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      ignorePatterns = [ "rm *" "pkill *" "cp *" ];
    };

    # 👇 Tell Starship which config file to use
    initExtra = ''
      export STARSHIP_CONFIG="$HOME/.config/ghostty/starship.toml"
    '';
  };

  # Starship enabled for Zsh
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # Zoxide, Atuín, and Carapace enabled for Zsh
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
  };

  # 👇 This CREATES the real Starship config file
  home.file.".config/ghostty/starship.toml".text = ''
    format = """
    ($nix_shell$container$git_metrics)$cmd_duration$hostname$localip$shlvl$shell$env_var$jobs$sudo$username$character$directory$git_branch$git_status$nodejs$python$rust$time
    """

    palette = "poimandres"

    [palettes.poimandres]
    overlay = "#252b37"
    overlayd = "#171922"
    overlaydd = "#1b1e28"
    love = "#d0679d"
    gold = "#add7ff"
    rose = "#5de4c7"
    pine = "#4ebe96"
    foam = "#54c0a3"
    iris = "#ffffff"

    [directory]
    format = "[](fg:overlayd)[ $path ]($style)[](fg:overlayd) "
    style = "bg:overlayd fg:pine"
    truncation_length = 5
    truncation_symbol = ""
    truncate_to_repo = false

    [git_branch]
    symbol = " "
    style = "bg:overlaydd fg:foam"
    format = "[](fg:overlaydd)[ $symbol$branch ]($style)[](fg:overlaydd) "

    [git_status]
    style = "bg:overlaydd fg:love"
    format = "[](fg:overlaydd)[$all_status$ahead_behind]($style)[](fg:overlaydd) "

    [time]
    disabled = false
    time_format = "%I:%M%P"
    style = "bg:overlay fg:rose"
    format = "[](fg:overlay)[ $time 󰴈 ]($style)[](fg:overlay)"

    [nodejs]
    symbol = " "
    style = "bg:overlay fg:pine"

    [python]
    symbol = " "
    style = "bg:overlay fg:pine"

    [rust]
    symbol = " "
    style = "bg:overlay fg:pine"
  '';

  home.packages = with pkgs; [
    # optional
  ];
}
