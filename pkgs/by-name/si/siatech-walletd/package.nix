{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "siatech-walletd";
  version = "0.8.0";

  src = fetchFromGitHub {
    owner = "SiaFoundation";
    repo = "walletd";
    rev = "v${version}";
    hash = "sha256-1gl1oybzBBrVyVIuO2o6TojjykQL0CK60B3Wiw8QkXU=";
  };

  vendorHash = "sha256-mPLE4CVVlK5HgcPLae2vQCPMd/MRI2cxhEO5zAgLC40=";

  meta = {
    description = "The flagship Sia wallet, suitable for miners, exchanges, and everyday hodlers.";
    homepage = "https://github.com/SiaFoundation/walletd";
    license = lib.licenses.mit;
    mainProgram = "walletd";
    maintainers = with lib.maintainers; [ pmw ];
  };
}
