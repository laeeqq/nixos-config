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
  ];
}