{ config, pkgs, ... }:

{
  users.groups.media = {};

  users.users.qbittorrent = {
    isSystemUser = true;
    group = "media";
  };

  services.qbittorrent = {
    enable = true;
    user = "qbittorrent";
    group = "media";
    webuiPort = 8080;
    openFirewall = true;
  };
}
