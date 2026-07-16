package: git
description: Git distributed version control system
version: "2.49.0"
source: https://github.com/git/git
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - curl
  - expat
# macOS: source Git from Homebrew. Git is a standalone CLI tool (nothing in the
# stack links libgit), so version drift is irrelevant; brew git is 2.54.x vs the
# pinned 2.49.0 (same major). prefer_system gated osx.* leaves the Linux
# from-source build untouched.
prefer_system: "osx.*"
homebrew_formula: git
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix git >/dev/null 2>&1; then
    brew install git >&2 || true
  fi
  echo "bits_system_replace: git"
prefer_system_replacement_specs:
  git:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin"
      HOMEBREW_FORMULA=git
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  make configure
  ./configure --prefix=$INSTALLROOT --with-openssl --with-curl --with-expat --with-tcltk
}
