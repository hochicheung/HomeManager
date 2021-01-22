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
				krita
				audacity
				vlc
				ripgrep
				dnsmasq
				sqlite
				graphviz
				emacsPackages.vterm
				emacsPackages.pdf-tools
				python3
				python39Packages.tldextract
				qutebrowser
				clang
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
