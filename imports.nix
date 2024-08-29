{ ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./fonts.nix
      ./networking.nix
      ./security.nix
      ./apps
      ./awesome
    ];
}
