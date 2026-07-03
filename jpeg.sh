package: jpeg
description: libjpeg JPEG image compression/decompression library (IJG)
version: "3.1.3"
tag: "3.1.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libjpeg-turbo-3.1.3.tar.gz
requires:
  - CMake
# macOS sources libjpeg-turbo from Homebrew (see HomebrewRecipe / `bits brew`);
# Linux is unaffected — prefer_system is gated to osx.* so the recipe below
# still builds from source there.
prefer_system: "osx.*"
homebrew_formula: jpeg-turbo
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix jpeg-turbo >/dev/null 2>&1; then
    brew install jpeg-turbo >&2 || true
  fi
  echo "bits_system_replace: jpeg"
prefer_system_replacement_specs:
  jpeg:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib"
      HOMEBREW_FORMULA=jpeg-turbo
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-IJG
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release 
}
