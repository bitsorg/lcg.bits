package: herwig
description: Herwig Monte Carlo event generator for high-energy collisions
version: "6.521.2"
tag: "6.521.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/herwig-6.521.2-src.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
patches:
  - herwig-6.521.2.patch
env:
  HERWIG_INSTALL_PATH: "$HERWIG_ROOT/lib/herwig"
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function Configure() {
  # macOS: herwig's configure adds "-Wl,-flat_namespace" to LDFLAGS for Darwin
  # — the old way to allow undefined symbols (libherwig legitimately references
  # external CIRCE/TAUOLA/EURODEC routines resolved at application link time).
  # On the modern macOS linker (Xcode 26), -flat_namespace alone no longer
  # suppresses undefined symbols, so the libherwig dylib link fails. Replace it
  # with the modern "-undefined dynamic_lookup" (+ -headerpad_max_install_names
  # so bits' relocate-me.sh can rewrite the install name). The block is already
  # Darwin-gated in configure, so Linux is unaffected; we gate here too.
  if [ "$(uname)" = Darwin ] && grep -q 'LDFLAGS -Wl,-flat_namespace' configure; then
    perl -i -pe 's/LDFLAGS="\$LDFLAGS -Wl,-flat_namespace"/LDFLAGS="\$LDFLAGS -Wl,-undefined,dynamic_lookup -Wl,-headerpad_max_install_names"/' configure
  fi
  ./configure --prefix="$INSTALLROOT" \
    "FFLAGS=-O2 -fPIC -Wuninitialized -fno-automatic -fno-range-check" \
    F77=${FC:-gfortran} CC=$CC
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv HERWIG_ROOT $PKG_ROOT
setenv HERWIG_INSTALL_PATH $PKG_ROOT/lib/herwig
EOF
}
