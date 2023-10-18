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
    pavucontrol
    neofetch
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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/dneumann/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
