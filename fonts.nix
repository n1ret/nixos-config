{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    meslo-lg
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];

  fonts.fontconfig = {
    defaultFonts = {
      serif = [ "Symbols Nerd Font" ];
      sansSerif = [ "Symbols Nerd Font" ];
      monospace = [ "Symbols Nerd Font Mono" ];
    };
  };

  console = {
    packages = with pkgs; [ terminus_font ];
    font = "${pkgs.terminus_font}/share/consolefonts/ter-124b.psf.gz";
  };
}
