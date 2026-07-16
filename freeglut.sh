package: freeglut
description: FreeGLUT open-source OpenGL utility toolkit
version: "3.8.0"
source: https://github.com/freeglut/freeglut
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
# macOS: source freeglut from Homebrew (formula freeglut, 3.8.0, arm64 bottle).
# prefer_system gated osx.* so Linux keeps building from source below.
prefer_system: "osx.*"
homebrew_formula: freeglut
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix freeglut >/dev/null 2>&1; then
    brew install freeglut >&2 || true
  fi
  echo "bits_system_replace: freeglut"
prefer_system_replacement_specs:
  freeglut:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--lib --cmake"
      HOMEBREW_FORMULA=freeglut
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
