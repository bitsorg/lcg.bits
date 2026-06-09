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
  # macOS: swig links pcre2 dynamically (pcre2 provides no static .a here), and
  # pcre2's install name is @rpath/libpcre2-8.0.dylib. The swig binary is built
  # with no LC_RPATH, so it cannot launch ("Library not loaded:
  # @rpath/libpcre2-8.0.dylib ... no LC_RPATH's found"), which breaks every swig
  # consumer (apfel, ...). Add an rpath to pcre2's lib dir. PCRE2_ROOT is the
  # canonical /sw/<arch>/pcre2/<ver> path, which is relocation-stable, so the
  # rpath remains valid after install. Linux is unaffected (ELF rpath/ld.so).
  [ "$(uname)" = Darwin ] && export LDFLAGS="-Wl,-rpath,${PCRE2_ROOT}/lib ${LDFLAGS:-}"
  $SOURCEDIR/configure --prefix=$INSTALLROOT --with-pcre-prefix=${PCRE2_ROOT} PCRE_LIBS=${PCRE2_ROOT}/lib/libpcre.a --with-boost=${Boost_ROOT}
}
