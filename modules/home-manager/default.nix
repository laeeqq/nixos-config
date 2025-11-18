{
  inputs,
  system,
  pkgs,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit system;
    };
    users = {
      "laeeq" = import ./laeeq.nix;
    };
    backupFileExtension = "bak";
  };
}