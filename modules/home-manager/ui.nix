{
  inputs,
  system,
  ...
}: {
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
  };
  

  home.packages = [
    inputs.noctalia.packages.${system}.default
  ];

  systemd.user.startServices = "sd-switch";


}
