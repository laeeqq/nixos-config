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
    initContent = ''
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
"$schema" = "https://starship.rs/config-schema.json"

add_newline = true

format = """
[░▒▓](fg:#6e6a86)\
[ 󰬃 ](bg:#1c1f2b fg:#e6e6e6)\
[](bg:#4dd0e1 fg:#1c1f2b)\
$directory\
[](fg:#4dd0e1 bg:#394260)\
$git_branch\
$git_status\
[](fg:#394260 bg:#212736)\
$nodejs\
$rust\
$golang\
$php\
[](fg:#212736 bg:#07080c)\
$time\
[ ](fg:#07080c)\
\n$character
"""

# =========================
# 📁 Directory
# =========================
[directory]
style = "fg:#07080c bg:#7aa2f7"
format = "[ $path ]($style)"
truncation_length = 4
truncation_symbol = "…/"
truncate_to_repo = false

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = " "
"Pictures" = " "

# =========================
# 🌱 Git
# =========================
[git_branch]
symbol = " "
style = "bg:#394260 fg:#4dd0e1"
format = "[$symbol$branch]($style)"

[git_status]
style = "bg:#394260 fg:#ff6f91"
format = "[($all_status$ahead_behind)]($style)"

# =========================
# 🟢 Languages
# =========================
[nodejs]
symbol = ""
style = "bg:#212736 fg:#4dd0e1"
format = "[ $symbol ($version) ]($style)"

[rust]
symbol = ""
style = "bg:#212736 fg:#4dd0e1"
format = "[ $symbol ($version) ]($style)"

[golang]
symbol = ""
style = "bg:#212736 fg:#4dd0e1"
format = "[ $symbol ($version) ]($style)"

[php]
symbol = ""
style = "bg:#212736 fg:#4dd0e1"
format = "[ $symbol ($version) ]($style)"

# =========================
# 🕒 Time
# =========================
[time]
disabled = false
time_format = "%H:%M"
style = "bg:#07080c fg:#ffd97d"
format = "[  $time ]($style)"

# =========================
# ➜ Prompt Arrow
# =========================
[character]
success_symbol = "[🏎️](fg:#7aa2f7) "
error_symbol   = "[🏎️](fg:#ff6f91) "




'';


  home.packages = with pkgs; [
    # optional
  ];
}
