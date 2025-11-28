# inputs
{
  pkgs,
  system,
  inputs,
  ...
}:N
# outputs
{
  home.packages = with pkgs; [
    spotify
    obsidian
    discord
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
  ];
}
