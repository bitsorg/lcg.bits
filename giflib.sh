package: giflib
description: GIF image format library
version: "5.2.2"
tag: "5.2.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
# macOS: source the GIF codec from Homebrew (giflib) — a stable leaf image
# library, same class as libpng/jpeg/tiff. prefer_system is gated osx.* so Linux
# keeps building from source below.
prefer_system: "osx.*"
homebrew_formula: giflib
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix giflib >/dev/null 2>&1; then
    brew install giflib >&2 || true
  fi
  echo "bits_system_replace: giflib"
prefer_system_replacement_specs:
  giflib:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--lib"
      HOMEBREW_FORMULA=giflib
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--lib"
##############################
function Make() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # Only forward CC if it is non-empty; giflib's Makefile defaults to 'cc'.
  make ${CC:+CC="$CC"} ${JOBS:+-j $JOBS} \
    $(uname | grep -q Darwin && echo libgif.dylib || echo libgif.so) libgif.a
}
function MakeInstall() {
  make install-bin install-include install-lib PREFIX="$INSTALLROOT"
}
