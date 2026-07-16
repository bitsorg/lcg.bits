package: Qt5
description: Qt5 cross-platform application and UI framework
version: "5.15.15"
source: https://code.qt.io/cgit/qt/qt5.git/
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/qt-everywhere-opensource-src-5.15.15.tar.gz
requires:
  - Python
  - fontconfig
# macOS: source Qt5 from Homebrew (qt@5, 5.15.x, keg-only). Building Qt5 from
# source on arm64 macOS fails (configure cannot detect Desktop OpenGL, and the
# bundled QtWebEngine/Chromium is unbuildable). prefer_system gated osx.* so
# Linux keeps building from source below. NOTE: Homebrew qt@5 omits QtWebEngine,
# so pyqtwebengine is disabled on macOS.
prefer_system: "osx.*"
homebrew_formula: qt@5
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix qt@5 >/dev/null 2>&1; then
    brew install qt@5 >&2 || true
  fi
  echo "bits_system_replace: Qt5"
prefer_system_replacement_specs:
  Qt5:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib --cmake"
      HOMEBREW_FORMULA=qt@5
      # Qt keeps mkspecs/plugins/qml at the top of its prefix (not under lib).
      HOMEBREW_LINK_DIRS="bin lib include share mkspecs plugins qml libexec"
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
patches:
  - Qt5-5.15.15.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ${qt_enable_standard} ./configure ${Qt5_extra_config_opts} -no-separate-debug-info -release --prefix=$INSTALLROOT -nomake examples -nomake tests --opensource --confirm-license
}
