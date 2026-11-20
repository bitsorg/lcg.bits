package: tiff
description: LibTIFF library for TIFF image file format
version: "4.7.2"
source: https://gitlab.com/libtiff/libtiff
tag: "v%(version)s"
# bits upgrade: no tarball of 4.7.2, built from the git tag
# sources:
#   - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - jpeg
# macOS sources libtiff from Homebrew (see HomebrewRecipe / `bits brew`); Linux
# is unaffected — prefer_system is gated to osx.* so the recipe below still
# builds from source there.
prefer_system: "osx.*"
homebrew_formula: libtiff
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix libtiff >/dev/null 2>&1; then
    brew install libtiff >&2 || true
  fi
  echo "bits_system_replace: tiff"
prefer_system_replacement_specs:
  tiff:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib --pkgconfig"
      HOMEBREW_FORMULA=libtiff
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
references:
  - cpe:2.3:a:libtiff:libtiff:%(version)s
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
# 4.7.2 finds libjpeg through libjpeg-turbo's CMake config: the prefix path makes it the
# stack's jpeg (as ROOT's), not the container's, which names files the image lacks.
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
      ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
    -DCMAKE_INSTALL_LIBDIR=lib
}
