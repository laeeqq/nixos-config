{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./apps.nix
  ];

  home.username ="laeeq";
  home.homeDirectory ="/home/laeeq";

  home.stateVersion ="25.05"; 
  nixpkgs.config.allowUnfree = true;


}