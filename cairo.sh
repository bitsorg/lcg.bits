package: cairo
description: Cairo 2D vector graphics library with multiple backends
version: "1.18.4"
tag: "1.18.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - pixman
  - pkg_config
  - freetype
  - fontconfig
  - meson
  - ninja
# macOS: source cairo from Homebrew (1.18.4, exact pinned version). Building
# from source pulls a vendored glib subproject that fails (pcre2.h not found),
# and cairo is a stable 2D-graphics lib sitting on the freetype/fontconfig/
# pixman/libpng already taken from Homebrew. prefer_system gated osx.* so Linux
# keeps building from source below.
prefer_system: "osx.*"
homebrew_formula: cairo
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix cairo >/dev/null 2>&1; then
    brew install cairo >&2 || true
  fi
  echo "bits_system_replace: cairo"
prefer_system_replacement_specs:
  cairo:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--lib --pkgconfig --cmake"
      HOMEBREW_FORMULA=cairo
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include MesonRecipe)
##############################
MODULE_OPTIONS="--lib --pkgconfig --cmake"
##############################
