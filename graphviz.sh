package: graphviz
description: Graphviz graph visualization software
version: "12.2.1"
source: https://gitlab.com/graphviz/graphviz
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - libtool
  - expat
  - fontconfig
  - png
  - gettext
# macOS: source Graphviz from Homebrew - a from-source build fails on the current
# macOS SDK, and brew bundles its many deps. prefer_system gated osx.* so Linux
# keeps building from source below (brew is 15.x vs pinned 12.2.1; API is stable).
prefer_system: "osx.*"
homebrew_formula: graphviz
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix graphviz >/dev/null 2>&1; then
    brew install graphviz >&2 || true
  fi
  echo "bits_system_replace: graphviz"
prefer_system_replacement_specs:
  graphviz:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib --pkgconfig"
      HOMEBREW_FORMULA=graphviz
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: EPL-1.0
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  ./configure --prefix $INSTALLROOT
}
