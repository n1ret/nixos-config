{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./fonts.nix
      ./apps
      ./awesome
    ];

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    extraEntries = builtins.readFile ./grub-extra.cfg;
  };
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-laptop";
  networking.networkmanager.enable = true;

  time.timeZone = "Etc/GMT-5";

  console = {
    packages = with pkgs; [ terminus_font ];
    font = "${pkgs.terminus_font}/share/consolefonts/ter-124b.psf.gz";
  };

  system.stateVersion = "23.11";
}

