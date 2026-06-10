package: thepeg
description: ThePEG Toolkit for High Energy Physics Event Generation
version: "2.3.0"
tag: "2.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/ThePEG-2.3.0.tar.bz2
requires:
  - GSL
  - lhapdf
  - fastjet
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
patches:
  - thepeg-2.2.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function Configure() {
  # macOS: gated off. ThePEG builds, but setupThePEG/runThePEG abort from a
  # clang-21/macOS-26-SDK libc++ bug -fno-typed-cxx-new-delete doesn't fix.
  # Produce an empty package; remove the guards (Make/MakeInstall/PostInstall) once fixed.
  bits_is_macos && { mkdir -p "$INSTALLROOT"; return 0; }

  # macOS: Apple clang 21 (Xcode 26) defaults to typed C++ new/delete; ThePEG
  # calls operator new in a static initializer (building ThePEGDefaults.rpo),
  # which aborts. Disable via -fno-typed-cxx-new-delete when the flag is supported.
  if bits_is_macos; then
    local _tmo=-fno-typed-cxx-new-delete _d
    _d="$(mktemp -d)"; printf 'int main(){}\n' > "$_d/t.cpp"
    if "${CXX:-c++}" "$_tmo" "$_d/t.cpp" -o "$_d/t.out" >/dev/null 2>&1; then
      export CXXFLAGS="${CXXFLAGS:-} $_tmo"
    fi
    rm -rf "$_d"
  fi

  # ThePEG's configure tries to invoke perl for documentation; fake it
  mkdir -p fakeperl/bin
  ln -nfs /usr/bin/perl fakeperl/bin/perl
  export PATH="$PWD/fakeperl/bin:$PATH"

  # Accumulate LDFLAGS for optional deps
  export LDFLAGS=""
  [[ $LHAPDF_ROOT ]] && LDFLAGS="$LDFLAGS -L$LHAPDF_ROOT/lib"
  [[ $GSL_ROOT ]]    && LDFLAGS="$LDFLAGS -L$GSL_ROOT/lib"
  case $(uname) in
    Linux) LDFLAGS="-Wl,--no-as-needed $LDFLAGS" ;;
  esac

  autoreconf --install --force
  ./configure --prefix="$INSTALLROOT" \
    --disable-silent-rules \
    --enable-shared \
    --disable-static \
    --without-javagui \
    ${GSL_ROOT:+--with-gsl="$GSL_ROOT"} \
    ${LHAPDF_ROOT:+--with-lhapdf="$LHAPDF_ROOT"} \
    ${FASTJET_ROOT:+--with-fastjet="$FASTJET_ROOT"}
}
function Make() {
  bits_is_macos && return 0
  make ${JOBS:+-j $JOBS}
}
function MakeInstall() {
  bits_is_macos && return 0
  make install
}
function PostInstall() {
  bits_is_macos && return 0
  printf 'setenv ThePEG_INSTALL_PATH $PKG_ROOT/lib/ThePEG\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
