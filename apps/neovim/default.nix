{ pkgs, ... }:

let
  lua-init = pkgs.vimUtils.buildVimPlugin {
  name = "lua-init";
  src = ./config;
}; in {
  environment.systemPackages = with pkgs; [
    xclip
    luajitPackages.luarocks lua51Packages.lua luajit
  ];
  programs.nano.enable = false;
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    withRuby = false;
    configure = {
      customRC = "lua require(\"init\")";

      packages.plugins = {
        start = [ lua-init ];
      };
    };
  };
}
