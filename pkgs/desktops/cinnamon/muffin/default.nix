{ stdenv
, lib
, fetchFromGitHub
, cinnamon-desktop
, dbus
, desktop-file-utils
, glib
, gobject-introspection
, graphene
, gtk3
, json-glib
, libcanberra-gtk3
, libgnomekbd
, libgudev
, libstartup_notification
, libXdamage
, libxkbcommon
, libXtst
, mesa
, meson
, ninja
, pipewire
, pkg-config
, python3
, udev
, wrapGAppsHook
}:

stdenv.mkDerivation rec {
  pname = "muffin";
  version = "5.4.2";

  src = fetchFromGitHub {
    owner = "linuxmint";
    repo = pname;
    rev = version;
    hash = "sha256-MT26Kk5xpdAK2dSaLAN0Ih7qeWVDEINllc3UbiIVZjY=";
  };

  nativeBuildInputs = [
    desktop-file-utils
    gobject-introspection
    meson
    ninja
    pkg-config
    python3
    wrapGAppsHook
  ];

  buildInputs = [
    cinnamon-desktop
    dbus
    glib
    graphene
    gtk3
    json-glib
    libcanberra-gtk3
    libgnomekbd
    libgudev
    libstartup_notification
    libXdamage
    libxkbcommon
    libXtst
    mesa
    pipewire
    udev
  ];

  meta = with lib; {
    homepage = "https://github.com/linuxmint/muffin";
    description = "The window management library for the Cinnamon desktop (libmuffin) and its sample WM binary (muffin)";
    license = licenses.gpl2;
    platforms = platforms.linux;
    maintainers = teams.cinnamon.members;
  };
}
