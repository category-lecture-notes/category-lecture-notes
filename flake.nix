{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";

    typst-tikz = {
      url = "github:category-lecture-notes/typst-tikz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, flake-utils, nixpkgs, typst-tikz }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        typst = typst-tikz.packages.${system}.default;
      in rec {
        packages = {
          default = let version = self.shortRev or self.lastModifiedDate;
          in pkgs.stdenv.mkDerivation {
            name = "category-lecture-notes-${version}";
            fullname = "category-lecture-notes";

            nativeBuildInputs = [ typst ];

            src = ./.;

            configurePhase = ''
              echo -n '#let commit_hash = "${version}"' >> src/metadata.typ
            '';

            buildPhase = "typst-tikz compile src/main.typ";
            installPhase = "install -m 0644 -vD src/main.pdf $out/$fullname.pdf";

            meta = with pkgs.lib; {
              description = "Category lecture notes";
              homepage =
                "https://github.com/category-lecture-notes/category-lecture-notes";
            };
          };
        };

        devShells = {
          default = pkgs.mkShell {
            packages = [ typst ];
          };
        };
      });
}
