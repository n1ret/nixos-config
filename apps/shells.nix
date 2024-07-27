{ pkgs, ... }:

{
  programs.zsh.enable = true;
  users.users.root.shell = pkgs.zsh;
  environment.pathsToLink = [ "/share/zsh" ];

  programs.thefuck = {
    enable = true;
    alias = "блять";
  };
}
