package: thepeg
description: ThePEG Toolkit for High Energy Physics Event Generation
version: "2.2.1"
tag: "2.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/ThePEG-2.2.1.tar.bz2
requires:
  - GSL
  - lhapdf
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
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' "$SOURCEDIR"/ .

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
