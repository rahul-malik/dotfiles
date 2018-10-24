{ config, lib, pkgs, users, ... }:

let
  fastarcheyosx = pkgs.callPackage ./src/fastarcheyosx/c.nix {};
  scmpuff = pkgs.callPackage ./src/scmpuff/c.nix {};
  highlight = pkgs.callPackage ./src/highlight/c.nix {};
  bat = pkgs.callPackage ./src/bat.nix {};
in
{

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 2;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 4;
  nix.buildCores = 4;

  # Bkase stuff
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 12;
  system.defaults.NSGlobalDomain.KeyRepeat = 1;

  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.FXEnableExtensionChangeWarning = false;
  services.nix-daemon.enable = true;

  imports = [
    ./src/vim/c.nix
    ./src/fish/c.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.programs.java.enable = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    arcanist
    cmake
    bsdiff
    fastarcheyosx
    scmpuff
    highlight
    ocaml
    opam
    ocamlPackages.merlin
    ocamlPackages.camlp4
    asciinema
    fzf
    fish
    gettext
    git
    ripgrep
    jq
    wget
    go
    fasd
    nox
    coreutils
    watchman
    ocamlPackages.reason
    jekyll
    cloc
    tree
    docker
    docker-machine
    watchman
    yarn
    nodejs
    cmake
    ninja
    cmark
    postgresql
    bloaty
    fd
    jdk
    jre
    thrift
  ];


  environment.extraOutputsToInstall = [ "man" ];

  # For some reason I get nix build errors when this is enabled
  nix.requireSignedBinaryCaches = false;

  services.activate-system.enable = true;
  nix.package = pkgs.nix;
}
