# ~/nixos/modules/home-manager/default.nix
{ inputs, system, pkgs, ... }:

{
  # Extra arguments for Home Manager
  home-manager.extraSpecialArgs = {
    inherit inputs;
    inherit system;
  };

  # Optional: backup configuration
  home-manager.backupFileExtension = ".oldbak";

  # Do NOT define `home-manager.users` here! 
  # Users should be defined in the host configuration
}
