package: R
description: R statistical computing language and environment
version: "4.5.0"
tag: "4.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - fribidi
  - readline
# macOS: source R from Homebrew. R is a large statistical environment pulling in
# a long chain of dependencies (cairo, openblas, tcl-tk, pcre2, xz, fontconfig,
# X11 libs, a Fortran compiler...) that is painful to build against the current
# macOS SDK; brew's `r` formula bundles them all. brew r is 4.6.0 vs the pinned
# 4.5.0 (one minor), and the only consumer (rpy2) works across R 4.x. prefer_system
# gated osx.* so Linux keeps building 4.5.0 from source below.
prefer_system: "osx.*"
homebrew_formula: r
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix r >/dev/null 2>&1; then
    brew install r >&2 || true
  fi
  echo "bits_system_replace: R"
prefer_system_replacement_specs:
  R:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib"
      HOMEBREW_FORMULA=r
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
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # readline is now a system dependency (see readline.sh): the bits build is
  # gone, so we use the OS readline, which R's configure finds in the default
  # /usr search paths. No READLINE_ROOT / CPPFLAGS / LDFLAGS overrides needed.
  ./configure --prefix=$INSTALLROOT --disable-R-framework --enable-R-shlib \
    --without-x --with-cairo --with-libpng --with-libtiff --with-jpeglib \
    --with-readline
}
