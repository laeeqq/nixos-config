{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      title = "Laeeq's Terminal";
      opacity = "0.8";
      background-blur = "true";
      font-size = "13";
      cursor-style = "block";
    };
  };
}
