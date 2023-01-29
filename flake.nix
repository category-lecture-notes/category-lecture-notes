{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-22.11";
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        texlive =
          pkgs.texlive.combine { inherit (pkgs.texlive) scheme-medium; };

      in rec {
        packages = {
          default = let version = self.shortRev or self.lastModifiedDate;
          in pkgs.stdenv.mkDerivation {
            name = "category-lecture-notes-${version}";
            fullname = "category-lecture-notes";

            src = ./src;

            nativeBuildInputs = [ texlive ];

            configurePhase = ''
              echo -n "\\newcommand{\\documentVersion}{${version}}" > version.tex
            '';

            buildPhase = ''
              latexmk -shell-escape -interaction=nonstopmode -halt-on-error \
                -norc -pdflatex="xelatex %O %S" -pdf "main.tex"
            '';

            installPhase =
              ''install -m 0644 -vD main.pdf "$out/$fullname.pdf"'';

            meta = with pkgs.lib; {
              description = "Category lecture notes";
              homepage =
                "https://github.com/category-lecture-notes/category-lecture-notes";
            };
          };
        };
      });
}
