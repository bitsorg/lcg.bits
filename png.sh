package: png
description: libpng official PNG reference library
version: "1.6.55"
tag: "1.6.55"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lib%(name)s-%(version)s.tar.gz
requires:
  - zlib
# macOS sources libpng from Homebrew (see HomebrewRecipe / `bits brew`); Linux
# is unaffected — prefer_system is gated to osx.* so the recipe below still
# builds from source there.
prefer_system: "osx.*"
homebrew_formula: libpng
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix libpng >/dev/null 2>&1; then
    brew install libpng >&2 || true
  fi
  echo "bits_system_replace: png"
prefer_system_replacement_specs:
  png:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib --pkgconfig"
      HOMEBREW_FORMULA=libpng
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Libpng
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
