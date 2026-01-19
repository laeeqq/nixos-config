# inputs
{
  pkgs,
  system,
  inputs,
  ...
}:
# outputs
{
  home.packages = with pkgs; [
    spotify
    obsidian
    discord
    nautilus
    inputs.zen-browser.packages."${system}".default
    eclipses.eclipse-sdk
    jetbrains.idea-oss    
    vscode
    jdk
    libreoffice
    zsh
    tmux
    xev
    usbutils
    unzip
    alejandra
    flatpak
    grim 
    slurp
    swappy
    starship
    

  ];
}
