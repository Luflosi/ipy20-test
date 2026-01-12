{
  lib,
  stdenv,
  ...
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "tools";
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

  installFlags = [
    "PREFIX=$(out)"
  ];

  strictDeps = true;

  # TODO: add meta information
})
