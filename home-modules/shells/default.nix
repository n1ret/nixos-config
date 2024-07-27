{ pkgs, ... }:

{
  programs = {
    zsh = import ./zsh.nix { inherit pkgs; };
    starship = import ./starship.nix { inherit pkgs; };
  };
}
