{ config, pkgs, ... }:

{
  services.plex = {
    enable = true;
    openFirewall = true;
  };

  users.groups.media = {};
  users.users.plex.extraGroups = [ "media" ];
}
