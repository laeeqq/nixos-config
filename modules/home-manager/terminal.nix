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
      # update = "sudo nixos-rebuild switch";

      rebuild = "${pkgs.nh}/bin/nh os switch ~/nixos";
      ls = "ls --color=auto";

    };

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];

    initContent = ''
    '';
  };

  home.packages = with pkgs; [
  
  ];
}
