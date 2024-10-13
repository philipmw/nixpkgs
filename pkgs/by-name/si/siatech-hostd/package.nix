{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "siatech-hostd";
  version = "1.1.2";

  src = fetchFromGitHub {
    owner = "SiaFoundation";
    repo = "hostd";
    rev = "v${version}";
    hash = "sha256-//B58+ijqTtzZhtXe95uTj9X2mKwOdWillrhswnmR0Q=";
  };

  vendorHash = "sha256-5+xEP+rb5mza2N3lEn8E6+WnCAVIh/PlkoJAe6Ks5jk=";

  meta = {
    description = "An advanced Sia host solution created by the Sia Foundation, designed to enhance the experience for storage providers within the Sia network.";
    homepage = "https://github.com/SiaFoundation/hostd";
    license = lib.licenses.mit;
    mainProgram = "hostd";
    maintainers = with lib.maintainers; [ pmw ];
  };
}
