{ config, pkgs, ... }:

{
  programs.home-manager = {
	  enable = true;
	};

  home = {
	  username = "samcheung";
    homeDirectory = "/home/samcheung";
	};
	
	nixpkgs.config.allowUnfree = true;
	
  home.packages = with pkgs; [
				rclone
				discord
				mupdf
				cmake
				libtool
				libvterm
				qbittorrent
				imagemagick
				xclip
				texlive.combined.scheme-medium
				hunspell
				hunspellDicts.en-us
				gnuplot
				krita
				audacity
				vlc
				ripgrep
				dnsmasq
				sqlite
				emacsPackages.vterm
				emacsPackages.pdf-tools
	];
}
