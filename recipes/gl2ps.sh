package: gl2ps
description: GL2PS OpenGL to PostScript/SVG/PDF rendering library
version: "1.4.2"
source: https://gitlab.onelab.info/gl2ps/gl2ps
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tgz
requires:
  - CMake
  - zlib
  - png
# macOS: source gl2ps from Homebrew (gl2ps) — stable GL->PostScript/PDF vector printing lib. prefer_system gated
# osx.* so Linux keeps building from source below.
prefer_system: "osx.*"
homebrew_formula: gl2ps
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix gl2ps >/dev/null 2>&1; then
    brew install gl2ps >&2 || true
  fi
  echo "bits_system_replace: gl2ps"
prefer_system_replacement_specs:
  gl2ps:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib --cmake"
      HOMEBREW_FORMULA=gl2ps
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GL2PS
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
