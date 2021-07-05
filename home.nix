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
				syncthing

				# E-mail
				isync
				msmtp
				notmuch
				bogofilter

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

	services.syncthing = {
	  enable = true;
	};

	programs.mbsync.enable = true;
	programs.msmtp.enable = true;
	programs.notmuch = {
		new.tags = [ "unread" "inbox" ];
		search.excludeTags = [ "deleted" "spam" ];
	  enable = true;
		hooks = {
		  preNew = "mbsync --all";
		};
	};

	accounts.email = {
	  accounts.gmail-hochi = {
		  address = "hochi.cheung.sam@gmail.com";
		  imap = {
		    host = "imap.gmail.com";
		    port = 993;
		  };
		  mbsync = {
		    enable = true;
			  create = "maildir";
		  };
		  msmtp.enable = true;
		  notmuch.enable = true;
		  primary = true;
		  realName = "Sam Cheung";
		  passwordCommand = "keepassxc-cli show -sa password ~/Documents/keepass/Database181214.kdbx gmail-hochi-app";
		  smtp = {
		    host = "smtp.gmail.com";
		    port = 587;
		  };
		  userName = "hochi.cheung.sam@gmail.com";
		};
	};
}
