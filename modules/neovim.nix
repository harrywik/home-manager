{ config, pkgs, ... }:
{
  programs.neovim = { 
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  programs.nvf = {
    enable = true;
    settings = {
    	vim = {
	      theme = {
			    enable = true; 
          name = "gruvbox";
			    style = "dark";
	      };
	      statusline.lualine.enable = true;
	      telescope.enable = true;
	      autocomplete.nvim-cmp.enable = true;
	      vimAlias = true;
	      viAlias = true;
        languages = {
          enableLSP = true;
          enableTreesitter = true;
          nix.enable = true;
          ts.enable = true;
          markdown.enable = true;
          html.enable = true;
          sql.enable = true;
          python.enable = true;
        };
        options = {
          backup = false;
        };
	    };
    };
  };
}
