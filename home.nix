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
				mupdf
				cmake
				discord
				libtool
				libvterm
				qbittorrent
				imagemagick
				xclip
				texlive.combined.scheme-full
				hunspell
				hunspellDicts.en-us
				hunspellDicts.sv-se
				gnuplot
				ripgrep
				dnsmasq
				sqlite
				graphviz
				emacsPackages.vterm
				emacsPackages.pdf-tools
				qutebrowser
				gcc
				jdk11
				xlayoutdisplay
	];

	programs.ssh = {
	  enable = true;
		
		matchBlocks = {
			"github.com" = {
			  identityFile = "~/.ssh/id_rsa-public-github";
				identitiesOnly = true;
				user = "Hochicheung";
			};
	  };
	};
}
