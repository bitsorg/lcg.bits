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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # --with-texdir redirects the gnuplot LaTeX package files (gnuplot.sty etc.)
  # from the system texmf tree (/usr/local/share/texmf/...) into INSTALLROOT,
  # avoiding a Permission denied failure during make install.
  #
  # --without-qt: gnuplot does not declare a Qt dependency, so don't let
  # configure auto-build the interactive Qt terminal against whatever Qt happens
  # to be on the host (non-reproducible). On macOS it picks up Homebrew Qt6,
  # whose headers need C++17 while gnuplot compiles qtterminal/ with an older
  # standard, breaking the build. The cairo/png/svg/x11 terminals are unaffected.
  #
  # macOS: the "system" readline is the BSD editline shim
  # (/usr/include/readline/readline.h), which lacks GNU readline functions
  # gnuplot 6 uses (term.c: "call to undeclared function 'rl_getc'"). Use
  # gnuplot's builtin line-editing on macOS rather than fighting editline vs the
  # keg-only Homebrew GNU readline. Linux keeps GNU readline (which has rl_getc).
  _readline=""
  bits_is_macos && _readline="--with-readline=builtin"
  ./configure --prefix="$INSTALLROOT" \
    --without-qt \
    ${_readline} \
    --with-texdir="${INSTALLROOT}/share/texmf/tex/latex/gnuplot"
}
##############################
