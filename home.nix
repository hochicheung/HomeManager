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
				dnsmasq
				qutebrowser
				gcc
				jdk11
				xlayoutdisplay
				syncthing

				# Haskell
				ghc

				# E-mail
				isync
				msmtp
				notmuch

				# Spelling
				aspell
				aspellDicts.sv
				aspellDicts.en
				
				# My Emacs dependencies 
				emacsPackages.vterm
				emacsPackages.pdf-tools
				libvterm
				imagemagick
				libtool
				sqlite
				graphviz

				cached-nix-shell
	];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
  };

  programs.bash.shellAliases = { nix-shell = "cached-nix-shell"; };

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
		  passwordCommand = "keepassxc-cli show -sa password ~/Documents/keepass/*.kdbx gmail-hochi-app";
		  smtp = {
		    host = "smtp.gmail.com";
		    port = 587;
		  };
		  userName = "hochi.cheung.sam@gmail.com";
		};
	};
}
