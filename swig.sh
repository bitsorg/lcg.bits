package: swig
description: SWIG interface compiler connecting C/C++ with scripting languages
version: "4.4.0"
tag: "4.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - pcre2
  - Python
  - Boost
prefer_system: ".*"
# macOS: source swig from Homebrew (build-time code generator; consumers only
# need the `swig` binary, nothing links a swig library). brew swig is 4.4.1 vs
# the pinned 4.4.0 — same minor, compatible — so listing it here puts it in the
# Brewfile and lets `bits --brew` install it on demand. Linux keeps the existing
# prefer_system-or-build-from-source behaviour unchanged.
homebrew_formula: swig
prefer_system_check: |
  verge() {
      [  "$1" = "`echo -e "$1\n$2" | sort -V | head -n1`" ]
  }
  # macOS: install swig from Homebrew on demand when run with `bits --brew`.
  if [ "$(uname)" = Darwin ] && [ "${BITS_BREW:-}" = "1" ] && ! which swig >/dev/null 2>&1; then
    brew install swig >&2 || true
  fi
  which swig && verge "$PKGVERSION" $(swig -version | grep Version | sed -e 's/[^0-9]*//')

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  $SOURCEDIR/configure --prefix=$INSTALLROOT --with-pcre-prefix=${PCRE2_ROOT} PCRE_LIBS=${PCRE2_ROOT}/lib/libpcre.a --with-boost=${Boost_ROOT}
}
