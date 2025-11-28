# links between the .config folder and your local .config

{...}: {
  home.file = {
    ".config/niri" = {
      force = true;
      source = ./niri;
      recursive = true;
    };

    ".config/ghostty" = {
      force = true;
      source = ./ghostty;
      recursive = true;
    };
  };
}
