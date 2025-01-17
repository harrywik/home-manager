{ config, pkgs, ... }:
{
  programs.zsh =  {
    enable = true;
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
}
