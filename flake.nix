{
  description = "Flake for building ipy20 related things";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ self, flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ];
      systems = [ "x86_64-linux" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        packages = {
          tools = pkgs.callPackage ./tools { };
          tests = pkgs.callPackage ./tests { };
          combined = pkgs.symlinkJoin {
            name = "tests-with-tools";
            paths = with self'.packages; [
              tools
              tests
            ];
          };
          default = self'.packages.combined;
        };
      };
    };
}
