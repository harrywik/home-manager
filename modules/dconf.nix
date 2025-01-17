{ config, pkgs, ... }:
{
  dconf.settings = {
  	"org/gnome/desktop/interface" = {
		color-scheme = "prefer-dark";
		gtk-enable-primary-past = false;
	};
	"org/gnome/shell" = {
		favorite-apps = [
			"Alacritty.desktop"
			"firefox.desktop"
			"bitwarden.desktop"
			"code.desktop"
			"nautilus.desktop"
		];
		disable-user-extensions = false;
		enabled-extensions = with pkgs.gnomeExtensions; [
			# active gnome extensions goes here
		];
	};

	"org/gnome/settings-daemon/plugins/media-keys" = {
	    	custom-keybindings = [
	      		"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/alacritty/"	
		];
	};
	"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/alacritty" = {
	    	binding = "<Ctrl><Alt>t"; 
		command = "alacritty";
	    	name = "open-terminal";
	};


	# then config gnome extension here
	#"org/gnome/shell/extensions/<name>" = { ... }
  };
}
