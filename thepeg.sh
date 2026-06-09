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
  # macOS: gated off. ThePEG builds, but setupThePEG/runThePEG abort at startup
  # from a clang-21 / macOS-26-SDK libc++ bug (typed operator new invoked in a
  # static initializer before libc++abi init) that -fno-typed-cxx-new-delete does
  # not fix — so ThePEG (and its consumers herwig3, thep8i) cannot run on this
  # toolchain. Produce an empty package; remove the guards (here, Make,
  # MakeInstall, PostInstall) to resume the port once the toolchain is fixed.
  bits_is_macos && { mkdir -p "$INSTALLROOT"; return 0; }

  # macOS: very new Apple clang (clang 21 / Xcode 26) defaults to typed C++
  # new/delete (-ftyped-cxx-new-delete). ThePEG calls operator new in a static
  # initializer — exercised when setupThePEG builds ThePEGDefaults.rpo — which
  # aborts under that feature ("Terminating due to typed operator new being
  # invoked before its static initializer in libcxx", Abort trap: 6). Disable it
  # when the compiler understands the flag (a no-op on Linux / older clang).
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
