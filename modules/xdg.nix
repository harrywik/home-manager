{ config, pkgs, ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Images
      "image/png" = [ "feh.desktop" ];
      "image/jpeg" = [ "feh.desktop" ];
      "image/svg+xml" = [ "feh.desktop" ];
      "image/gif" = [ "feh.desktop" ];
      "image/webp" = [ "feh.desktop" ];
      # Browser
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/chrome" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "application/x-extension-htm" = ["firefox.desktop" ];
      "application/x-extension-html" = [ "firefox.desktop" ];
			"application/x-extension-shtml" = [ "firefox.desktop" ];
			"application/xhtml+xml" = [ "firefox.desktop" ];
			"application/x-extension-xhtml" = [ "firefox.desktop" ];
			"application/x-extension-xht" = [ "firefox.desktop" ];
    };
  };
  xdg.desktopEntries.feh = {
    name = "feh";
    exec = "${pkgs.feh}/bin/feh";
  };
}
