{ pkgs, lib, ... }:

with pkgs;

let myVim = vim_configurable.customize {
  name = "vim";

  vimrcConfig = {
    customRC = builtins.readFile ./.vimrc;

    packages.myplugins = with pkgs.vimPlugins; {
      start = [ vim-nix vim-lastplace ];
      opt = [];
    };
  };
}; in {
  environment.systemPackages = with pkgs; [ myVim ];
  programs.nano.enable = false;
}
