{ pkgs, ... }: 

{
  imports =
    [
      ./vim
      ./neovim
      ./shells.nix
      ./another.nix
    ];
}
