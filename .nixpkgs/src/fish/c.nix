{ config, pkgs, ... }:

let
  pureFishSrc = pkgs.fetchFromGitHub {
    owner = "rahul-malik";
    repo = "pure";
    rev = "47722fa666823d2a35e6d2bf8d2048ad18b3a854";
    sha256 = "1phckydi077b77l3vsw1flii8yv5n2hhb2487m7qnd7ix1ylz0wy";
  };

  pureFish = pkgs.stdenvNoCC.mkDerivation rec {
    name = "pure-fish-${version}";
    version = "2018-02-08";
    phases = [ "unpackPhase" "installPhase" "fixupPhase" ];
    src = pureFishSrc;

    installPhase = ''
      mkdir -p $out/share/fish/functions
      cp installer.fish $out/share/fish/functions
    '';
  };
in
  {
    environment.systemPackages = with pkgs; [
      pureFish
    ];

    programs.fish = {
      enable = true;
      vendor.config.enable = true;
      vendor.completions.enable = true;
      vendor.functions.enable = true;

      promptInit = ''
        # show archey when prompt loads
        archey
      '';
      
      shellAliases = {
        c = "clear; archey";
        cls = "clear; archey; ls";
        cp = "cp -i";
        gb = "git branch";
        gc = "git commit";
        gca = "git commit -a";
        gcl = "git clone";
        gcob= "git checkout -b";
        gcp = "git cherry-pick";
        gd = "git diff";
        gf = "git fetch";
        ggp = "git grep";
        gl = "git log --decorate";
        gps = "git push";
        grb = "git rebase";
        gsh = "git show";
        gst = "git status";
        gup = "git pull --rebase";
        l = "ls";
        ls = "ls --color=auto --group-directories-first";
        mv = "mv -i";
        rm = "rm -i";
        v = "vim";
        vi = "vim";
        wlog = "git log --decorate --oneline";
      };

      interactiveShellInit = ''
      '';

    };
}
