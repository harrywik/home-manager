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
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    htop
    zsh
    vscode
    zplug
    meslo-lgs-nf
    bitwarden
    zoxide
    tree
  ]) ++ (with pkgs.gnomeExtensions; [
    # gnome extensions pkgs goes here
  ]);


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
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
    set -o vi
    bindkey "''${key[Up]}" up-line-or-search
    eval "$(zoxide init zsh)"
    '';

    shellAliases = {
    	ll = "ls -l";
	la = "ls -la";
	cd = "z";
    };

    history = {
	size = 10000;
	path = "$config.xdg.dataHome}/zsh/history";
    };

    zplug = {
	    enable = true;
	    plugins = [
		{
			name = "dracula/zsh";
			tags = [ "as:theme" "depth:1" ];
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
