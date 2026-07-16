package: swig
description: SWIG interface compiler connecting C/C++ with scripting languages
version: "4.4.0"
source: https://github.com/swig/swig
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - pcre2
  - Python
  - Boost
prefer_system: ".*"
# macOS: source swig from Homebrew (build-time generator; consumers need only the
# `swig` binary). brew swig 4.4.1 vs pinned 4.4.0 is compatible; listing it here
# adds it to the Brewfile for `bits --brew`.
homebrew_formula: swig
prefer_system_check: |
  verge() {
      [  "$1" = "`echo -e "$1\n$2" | sort -V | head -n1`" ]
  }
  # macOS: install swig from Homebrew on demand when run with `bits --brew`.
  if bits_is_macos && [ "${BITS_BREW:-}" = "1" ] && ! which swig >/dev/null 2>&1; then
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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  # macOS: swig links pcre2 dynamically (@rpath/libpcre2-8.0.dylib) but the binary
  # has no LC_RPATH, so it can't launch and breaks every consumer. Add an rpath to
  # PCRE2_ROOT/lib (relocation-stable canonical path).
  bits_is_macos && export LDFLAGS="-Wl,-rpath,${PCRE2_ROOT}/lib ${LDFLAGS:-}"
  $SOURCEDIR/configure --prefix=$INSTALLROOT --with-pcre-prefix=${PCRE2_ROOT} PCRE_LIBS=${PCRE2_ROOT}/lib/libpcre.a --with-boost=${Boost_ROOT}
}
