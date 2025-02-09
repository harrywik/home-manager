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

  imports = [
  	./packages.nix
	  ./modules/dconf.nix
	  ./modules/dotfiles.nix
	  ./modules/fonts.nix
	  ./modules/git.nix
	  ./modules/neovim.nix
	  ./modules/sessionVariables.nix
	  ./modules/vscode.nix
  	./modules/zsh.nix
    ./modules/xdg.nix
  ];


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
