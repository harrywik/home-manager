{ config, pkgs, ... }:
{
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
    # LaTeX + PDF
    #
    pandoc
    texliveFull
    kdePackages.okular
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
    jetbrains.idea-ultimate
    postman
    # neovim is installed systemwide
  ]) ++ (with pkgs; [
    #
    # Languages
    # mainly use:
    # devenv 
    #
  ]) ++ (with pkgs; [
    #
    # Audio and Images
    #
    gimp
    vlc
    feh
  ]) ++ (with pkgs; [
    # Inputs
    xorg.xinput
  ]) ++ (with pkgs; [
    # Database stuff
    mongodb-compass # MongoDB
  ]) ++ (with pkgs; [
    # Nix Development
    # devenv => system
  ]) ++ (with pkgs; [
	  nautilus
  ]);
}
