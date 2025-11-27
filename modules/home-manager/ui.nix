{
  inputs,
  system,
  ...
}: {
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  services.vicinae.enable = true;
  services.vicinae.autoStart = true;

  home.packages = [
    inputs.noctalia.packages.${system}.default
  ];
}
