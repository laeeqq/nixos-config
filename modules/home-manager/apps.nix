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
    discord45
    nautilus
    inputs.zen-browser.packages."${system}".default
    eclipses.eclipse-sdk
    jetbrains.idea-community-bin
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

  ];
}
