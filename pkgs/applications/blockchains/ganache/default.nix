{ pkgs, nodejs, stdenv, lib, xcbuild }:

let
  nodePackages = import ./node-composition.nix {
    inherit pkgs nodejs;
    inherit (stdenv.hostPlatform) system;
  };
in
nodePackages.ganache.override {
  pname = "ganache";
  nativeBuildInputs = lib.optional stdenv.isDarwin xcbuild;
  meta = with lib; {
    # FIXME
    # description = "The commitizen command line utility";
    # homepage = "https://commitizen.github.io/cz-cli";
    # maintainers = with maintainers; [ freezeboy ];
    # license = licenses.mit;
    # platforms = platforms.linux ++ platforms.darwin;
  };
}
