{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in rec {
        packages = {
          default = let version = self.shortRev or self.lastModifiedDate;
          in pkgs.stdenv.mkDerivation {
            name = "category-lecture-notes-${version}";
            fullname = "category-lecture-notes";

            nativeBuildInputs = [ pkgs.typst ];

            src = ./.;

            configurePhase = ''
              echo -n '#let commit_hash = "${version}"' >> src/metadata.typ
            '';

            buildPhase = "typst compile src/main.typ";
            installPhase = "install -m 0644 -vD src/main.pdf $out/$fullname.pdf";

            meta = with pkgs.lib; {
              description = "Category lecture notes";
              homepage =
                "https://github.com/category-lecture-notes/category-lecture-notes";
            };
          };
        };
      });
}
