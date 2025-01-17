{ config, pkgs, ... }:
{
  programs.git = {
  	enable = true;
	userName = "Harry Wik";
	userEmail = "harrywiksmail@gmail.com";
  };
}
