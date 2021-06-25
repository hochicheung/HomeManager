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
				mupdf
				cmake
				discord
				qbittorrent
				xclip
				ripgrep
				dnsmasq
				sqlite
				graphviz
				qutebrowser
				gcc
				jdk11
				xlayoutdisplay

				# Spelling
				hunspell
				hunspellDicts.en-us
				hunspellDicts.sv-se
				
				# My Emacs dependencies 
				emacsPackages.vterm
				emacsPackages.pdf-tools
				emacsPackages.org
				libvterm
				imagemagick
				texlive.combined.scheme-full
				libtool
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
