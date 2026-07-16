package: pixman
description: Pixman low-level pixel manipulation library
version: "0.46.0"
source: https://gitlab.freedesktop.org/pixman/pixman
tag: "pixman-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - meson
  - ninja
# macOS sources pixman from Homebrew (see HomebrewRecipe / `bits brew`); Linux
# is unaffected — prefer_system is gated to osx.* so the recipe below still
# builds from source there.
prefer_system: "osx.*"
homebrew_formula: pixman
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix pixman >/dev/null 2>&1; then
    brew install pixman >&2 || true
  fi
  echo "bits_system_replace: pixman"
prefer_system_replacement_specs:
  pixman:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--lib --pkgconfig"
      HOMEBREW_FORMULA=pixman
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include MesonRecipe)
##############################
MODULE_OPTIONS="--lib --pkgconfig"
