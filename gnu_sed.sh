package: gnu_sed
description: GNU sed stream editor
version: "4.5"
source: https://git.savannah.gnu.org/git/sed.git
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sed-4.5.tar.gz
# macOS: source GNU sed from Homebrew (gnu-sed). It installs as `gsed` (avoids
# shadowing BSD sed); the bin alias re-exposes it as `sed` to match Linux.
# osx.* gate so Linux keeps building from source below.
prefer_system: "osx.*"
homebrew_formula: gnu-sed
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix gnu-sed >/dev/null 2>&1; then
    brew install gnu-sed >&2 || true
  fi
  echo "bits_system_replace: gnu_sed"
prefer_system_replacement_specs:
  gnu_sed:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin"
      HOMEBREW_FORMULA=gnu-sed
      HOMEBREW_BIN_ALIASES="sed=gsed"
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix $INSTALLROOT
}
