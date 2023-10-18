{ config, pkgs, lib, ... }:
let 
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixos-unstable)
    # reuse the current configuration
    { config = config.nixpkgs.config; }; 
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
    kitty
    ripgrep
    yad # calendar and other popups
    love
    spotify
    newsboat
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
    export PATH="$PATH:~/.nix-profile/bin/"

    source ~/.nix-profile/etc/profile.d/nix.sh
    '';
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

  home.file.".emacs.d" = {
    source = ./configs/emacs;
    recursive = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
