{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    windowManager.awesome = {
      enable = true;
    };
    xkb = {
      layout = "us,ru";
      options = "grp:win_space_toggle";
    };
  };

  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };
  services.displayManager = {
    sddm = {
      enable = true;
      autoNumlock = true;
    };
    defaultSession = "none+awesome";
  };
}
