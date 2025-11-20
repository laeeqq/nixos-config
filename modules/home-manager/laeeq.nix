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
    (import ./terminal.nix { inherit pkgs; }) # <-- pass pkgs here
  ];

  home.username ="laeeq";
  home.homeDirectory ="/home/laeeq";

  home.stateVersion ="25.05"; 
  nixpkgs.config.allowUnfree = true;
  


}