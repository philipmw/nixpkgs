{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "siatech-renterd";
  version = "1.0.8";

  src = fetchFromGitHub {
    owner = "SiaFoundation";
    repo = "renterd";
    rev = "v${version}";
    hash = "sha256-2xQJuXwl/dXt8iv/ClD7OccX/zIJymlj5bSPGh5lQR0=";
  };

  vendorHash = "sha256-ggOLhQM2KZGx3ldxH1Yy3oQbBHifsRcCY8dhYGPH5yg=";

  checkPhase = ''
    runHook preCheck

    find . -maxdepth 1 -exec \
      go test --tags=testing -v -p $NIX_BUILD_CORES {} \;

    runHook postCheck
  '';

  meta = {
    description = "An advanced Sia renter engineered by the Sia Foundation. Designed to cater to both casual users seeking straightforward data storage and developers requiring a robust API for building apps on Sia.";
    homepage = "https://github.com/SiaFoundation/renterd";
    license = lib.licenses.mit;
    mainProgram = "renterd";
    maintainers = with lib.maintainers; [ pmw ];
    platforms = with lib.platforms; linux ++ darwin;
  };
}
