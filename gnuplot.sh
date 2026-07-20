package: gnuplot
description: Gnuplot portable interactive data and function plotting utility
version: "6.0.4"
source: https://github.com/gnuplot/gnuplot
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
  # optional:
  # - pango
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: gnuplot
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # --without-qt: no declared Qt dep; auto-building the Qt terminal against host
  # Qt6 is non-reproducible and breaks on macOS. --with-texdir: keep LaTeX in
  # INSTALLROOT (system texmf is RO). macOS: builtin line-editing (editline lacks rl_getc).
  _readline=""
  bits_is_macos && _readline="--with-readline=builtin"
  ./configure --prefix="$INSTALLROOT" \
    --without-qt \
    ${_readline} \
    --with-texdir="${INSTALLROOT}/share/texmf/tex/latex/gnuplot"
}
##############################
