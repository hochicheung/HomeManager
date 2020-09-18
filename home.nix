{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "samcheung";
  home.homeDirectory = "/home/samcheung";
	nixpkgs.config.allowUnfree = true;
	
  home.packages = [
				pkgs.git
				pkgs.qutebrowser
				pkgs.rclone
				pkgs.discord
				pkgs.mupdf
				pkgs.keepassxc
				pkgs.vim
				pkgs.cmake
				pkgs.libtool
				pkgs.libvterm
				pkgs.qbittorrent
				pkgs.emacsPackages.vterm
	];
}
