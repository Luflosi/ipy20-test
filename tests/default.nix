{
  lib,
  stdenv,
  pciutils,
  ...
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "tests";
  version = "0";

  src = let
    fs = lib.fileset;
  in fs.toSource {
    root = ./.;
    fileset = fs.unions [
      ./Makefile
      (fs.fileFilter (file: file.hasExt "c") ./.)
    ];
  };

  buildInputs = [
    pciutils
  ];

  installFlags = [
    "PREFIX=$(out)"
  ];

  strictDeps = true;

  # TODO: add meta information
})
