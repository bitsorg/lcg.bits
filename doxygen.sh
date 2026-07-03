package: doxygen
description: Doxygen documentation generator from annotated C++ sources
version: "1.16.1"
tag: "1.16.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.src.tar.gz
requires:
  - CMake
  - Python
  - graphviz
  - xapian
# macOS: source Doxygen from Homebrew (formula doxygen) — a standalone CLI doc
# tool with no consumers, so version drift is irrelevant. prefer_system gated
# osx.* so Linux keeps building 1.16.1 from source below.
prefer_system: "osx.*"
homebrew_formula: doxygen
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix doxygen >/dev/null 2>&1; then
    brew install doxygen >&2 || true
  fi
  echo "bits_system_replace: doxygen"
prefer_system_replacement_specs:
  doxygen:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin"
      HOMEBREW_FORMULA=doxygen
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
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
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=""
}
