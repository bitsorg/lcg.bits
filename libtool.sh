package: libtool
description: GNU Libtool shared library support script
version: "2.4.6"
source: https://git.savannah.gnu.org/git/libtool.git
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
# macOS: source libtool from Homebrew (libtool) — GNU libtool; brew installs it g-prefixed (glibtool/glibtoolize). prefer_system gated
# osx.* so Linux keeps building from source below.
prefer_system: "osx.*"
homebrew_formula: libtool
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix libtool >/dev/null 2>&1; then
    brew install libtool >&2 || true
  fi
  echo "bits_system_replace: libtool"
prefer_system_replacement_specs:
  libtool:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin"
      HOMEBREW_FORMULA=libtool
      HOMEBREW_BIN_ALIASES="libtool=glibtool libtoolize=glibtoolize"
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
