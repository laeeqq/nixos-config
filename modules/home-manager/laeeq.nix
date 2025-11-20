{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./apps.nix
    ./git.nix
    ./ui.nix
    ./.config/links.nix
  ];

  home.username ="laeeq";
  home.homeDirectory ="/home/laeeq";

  home.stateVersion ="25.05"; 
  nixpkgs.config.allowUnfree = true;
  #ZSH BASED TERMINAL
  programs.zsh = {
  enable = true;
  enableCompletion = true;

  autosuggestions.enable = true;
  syntaxHighlighting.enable = true;

  defaultShell = true;
};



}