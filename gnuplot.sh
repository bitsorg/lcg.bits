package: gnuplot
description: Gnuplot portable interactive data and function plotting utility
version: "6.0.4"
tag: "6.0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
  # optional:
  # - pango
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-gnuplot
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # --with-texdir redirects the gnuplot LaTeX package files (gnuplot.sty etc.)
  # from the system texmf tree (/usr/local/share/texmf/...) into INSTALLROOT,
  # avoiding a Permission denied failure during make install.
  ./configure --prefix="$INSTALLROOT" \
    --with-texdir="${INSTALLROOT}/share/texmf/tex/latex/gnuplot"
}
##############################
