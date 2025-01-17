{ config, pkgs, ... }:
{
  fonts.fontconfig.defaultFonts = {
  	monospace = [
		"Meslo LGS NF"
	];
  };
}
