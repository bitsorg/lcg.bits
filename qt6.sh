package: Qt6
description: Qt6 cross-platform application and UI framework
version: "6.8.3"
source: https://code.qt.io/cgit/qt/qt6.git/
mem_per_job: 1500
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/qt-everywhere-src-6.8.3.tar.xz
requires:
  - Python
  - fontconfig
  - html5lib
  - yacc-like
  - nodejs
  - zlib
  - ninja
# macOS: source Qt6 from Homebrew (formula qt, currently 6.11.x). prefer_system
# gated osx.* so Linux keeps building 6.8.3 from source below. NOTE: Homebrew qt
# is a few minor versions ahead of the pinned 6.8.3 — qwt/soqt (its consumers)
# may need attention if a Qt6 API they use changed.
prefer_system: "osx.*"
homebrew_formula: qt
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix qt >/dev/null 2>&1; then
    brew install qt >&2 || true
  fi
  echo "bits_system_replace: Qt6"
prefer_system_replacement_specs:
  Qt6:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib --cmake"
      HOMEBREW_FORMULA=qt
      HOMEBREW_LINK_DIRS="bin lib include share mkspecs plugins qml libexec"
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
patches:
  - Qt6-6.8.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Mirror lcgcmake: skip qtwebengine (heavy, needs nodejs/html5lib and is the
  # source of the html5lib import error) and let configure find system .pc files.
  export PKG_CONFIG_PATH="/usr/share/pkgconfig:${PKG_CONFIG_PATH}"
  ./configure -no-separate-debug-info -release --prefix=$INSTALLROOT \
    -nomake examples -nomake tests --opensource --confirm-license \
    -skip qtwebengine
}

function Make() {
  # Qt 6.x generates a Ninja build, not a Makefile -- the default `make` step
  # fails with "No targets specified and no makefile found". Build with ninja.
  ninja ${JOBS:+-j$JOBS}
}

function MakeInstall() {
  ninja install
}
