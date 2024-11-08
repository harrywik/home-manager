{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "harry";
  home.homeDirectory = "/home/harry";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = (with pkgs; [
    # 
    # Fonts
    # 
    meslo-lgs-nf
  ]) ++ (with pkgs; [
    #
    # Terminal
    #
    htop
    zsh
    zplug
    tree
    zoxide
  ]) ++ (with pkgs; [
    #
    # Secuirity
    #
    bitwarden
  ]) ++ (with pkgs; [
    #
    # Messaging
    #
    signal-desktop
  ]) ++ (with pkgs.gnomeExtensions; [
    #
    # gnome extensions pkgs goes here
    #
  ]) ++ (with pkgs; [
    #
    # Virtualization
    #
    distrobox
  ]) ++ (with pkgs; [
    # 
    # LaTeX
    #
    pandoc
    texliveFull
  ]) ++ (with pkgs; [
    #
    # Browsers
    #
    chromium
  ]) ++ (with pkgs; [
    #
    # IDEs
    #
    vscode
    # neovim is installed systemwide
  ]);
	


  programs.vscode = {
  	enable = true;
	enableUpdateCheck = false;
	enableExtensionUpdateCheck = false;
	mutableExtensionsDir = false;

	extensions = with pkgs.vscode-extensions; [
		julialang.language-julia
		ms-toolsai.jupyter
		vscodevim.vim
		dracula-theme.theme-dracula
		tomoki1207.pdf
		ms-python.black-formatter
		ms-python.python

	];

	userSettings = {
		"[python]" = {
			"editor.defaultFormatter" = "ms-python.black-formatter";
			"editor.formatOnSave" = true;
		};
		"notebook.formatOnSave.enabled" = true;
	};
  };

  programs.git = {
  	enable = true;
	userName = "Harry Wik";
	userEmail = "harrywiksmail@gmail.com";
  };

  fonts.fontconfig.defaultFonts = {
  	monospace = [
		"Meslo LGS NF"
	];
  };

  dconf.settings = {
  	"org/gnome/desktop/interface" = {
		color-scheme = "prefer-dark";
	};
	"org/gnome/shell" = {
		favorite-apps = [
			"Alacritty.desktop"
			"firefox.desktop"
			"bitwarden.desktop"
			"code.desktop"
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

  programs.neovim = {
    	enable = true;
	viAlias = true;
	vimAlias = true;
	defaultEditor = true;
  };

  programs.zsh =  {
    enable = true;
    enableCompletion = true;
    initExtra = ''
    set -o vi
    bindkey "''${key[Up]}" up-line-or-search
    eval "$(zoxide init zsh)"
    '';

    shellAliases = {
    	ll = "ls -l";
	la = "ls -la";
	cd = "z";
	nxsh = "nix-shell --command zsh";
    };

    history = {
	size = 10000;
	path = "${config.xdg.dataHome}/zsh/history";
    };

    zplug = {
	    enable = true;
	    plugins = [
		{
			name = "dracula/zsh";
			tags = [ "as:theme" "depth:1" ];
	      	}
		{
			name = "zsh-users/zsh-syntax-highlighting";
		}
		{
			name = "zsh-users/zsh-history-substring-search";
		}
	    ];
     };
  };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/harry/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
