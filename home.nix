{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "samcheung";
  home.homeDirectory = "/home/samcheung";
	nixpkgs.config.allowUnfree = true;
	
  home.packages = with pkgs; [
				git
				qutebrowser
				rclone
				discord
				mupdf
				keepassxc
				vim
				cmake
				libtool
				libvterm
				qbittorrent
				emacsPackages.vterm
				imagemagick
				xclip
				texlive.combined.scheme-medium
				light
				hunspell
				hunspellDicts.en-us
	];

}
