{ config, pkgs, lib, ... }:
let 
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixos-unstable)
    # reuse the current configuration
    { config = config.nixpkgs.config; }; 
  nurpkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") { inherit pkgs; };
in
{
  home.username = "dneumann";
  home.homeDirectory = "/home/dneumann";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    xss-lock
    pamixer
    networkmanagerapplet
    lxappearance
    nitrogen
    picom-next
    sxiv
    xorg.xrandr
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
    killall
    arandr
    emacs29
    unstable.neovim
    pavucontrol
    neofetch
    dmenu
    i3status
    i3lock
    i3blocks
    firefox
    discord

    # Gnome
    gnome.gnome-tweaks

    gnomeExtensions.appindicator
    gnomeExtensions.burn-my-windows

    kitty
    ripgrep
    yad # calendar and other popups
    love
    spotify
    newsboat

    # Programming Languages
    unstable.racket
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vscode"
    "nim2"
  ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    autocd = true;

    shellAliases = {
      ll = "ls -la";
      hello = ''echo " World!"'';
      update = "sudo nixos-rebuild switch";

      v = "$EDITOR";
      love = "nixGL love";
      kitty = "nixGL kitty";

      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gcm = "git commit -m";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git" 
      ];
      theme = "robbyrussell";
    };
    plugins = [
      { # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
    ];

    envExtra = ''
    export XDG_DATA_DIRS=$HOME/.nix-profile/share:$XDG_DATA_DIRS
    source ~/.nix-profile/etc/profile.d/nix.sh
    export PATH="$PATH:~/.nix-profile/bin/"
    '';

    initExtra = ''
    export PATH=$PATH:~/.config/scripts/
    export PATH=$PATH:~/.local/share/pnpm/ 
    '';
  };

  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      name = "Default";
      isDefault = true;
      extensions = with nurpkgs.repos.rycee.firefox-addons; [
        ublock-origin
        vimium
        darkreader
      ];
    };
  };

  home.file.".config/i3" = {
    source = ./configs/i3;
    recursive = true;
  };

  home.file.".config/picom" = {
    source = ./configs/picom;
    recursive = true;
  };

  home.file.".config/i3blocks" = {
    source = ./configs/i3blocks;
    recursive = true;
  };

  home.file.".config/nvim" = {
    source = ./configs/nvim;
    recursive = true;
  };

  home.file.".config/kitty" = {
    source = ./configs/kitty;
    recursive = true;
  };

  home.file.".config/fontconfig" = {
    source = ./configs/fontconfig;
    recursive = true;
  };

  home.file.".config/scripts" = {
    source = ./scripts;
    recursive = true;
  };

  home.file.".emacs.d" = {
    source = ./configs/emacs;
    recursive = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
