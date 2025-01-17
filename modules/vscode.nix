{ config, pkgs, ... }:
{
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
	] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
		{
			name = "modelica";
			publisher = "SimplyDanny";
			version = "0.0.4";
			sha256 = "sha256-rJ2OaEx/apI5OarNm5lKbNmsXZpqTbIFYYFHZUKy2Rg=";
		}
	];

	userSettings = {
		"[python]" = {
			"editor.defaultFormatter" = "ms-python.black-formatter";
			"editor.formatOnSave" = true;
		};
		"notebook.formatOnSave.enabled" = true;
	};
  };
}
