package: gnu_tar
description: GNU tar archiving utility
version: "1.30"
source: https://git.savannah.gnu.org/git/tar.git
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tar-1.30.tar.gz
# macOS: source GNU tar from Homebrew (gnu-tar). It installs as `gtar` (avoids
# shadowing BSD tar); the bin alias re-exposes it as `tar` to match Linux.
# osx.* gate so Linux keeps building from source below.
prefer_system: "osx.*"
homebrew_formula: gnu-tar
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix gnu-tar >/dev/null 2>&1; then
    brew install gnu-tar >&2 || true
  fi
  echo "bits_system_replace: gnu_tar"
prefer_system_replacement_specs:
  gnu_tar:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin"
      HOMEBREW_FORMULA=gnu-tar
      HOMEBREW_BIN_ALIASES="tar=gtar"
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
