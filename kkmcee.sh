package: kkmcee
description: KKMC-ee Monte Carlo generator for e+e- annihilation
version: "5.01.00"
tag: "5.01.00"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - ROOT
  - photoscpp
  - hepmc3
  - autoconf
  - automake
  - libtool
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-KKMC-ee
patches:
  - kkmcee-5.01.00.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake -E create_symlink dizet-6.45 dizet
  # configure.ac uses the obsolete AC_PROG_LIBTOOL; autoreconf fails with
  # "undefined or overquoted macro" because aclocal cannot find libtool's m4
  # macros, and then "cannot find config.guess/config.sub/...".  Put the bits
  # libtool/automake aclocal dirs on ACLOCAL_PATH and run libtoolize so the
  # macros are found and the auxiliary files are installed.
  export ACLOCAL_PATH="${LIBTOOL_ROOT}/share/aclocal:${AUTOMAKE_ROOT}/share/aclocal:${ACLOCAL_PATH}"
  libtoolize --install --copy --force
  autoreconf --force --install
  ./configure --with-photos=${PHOTOSCPP_ROOT} --prefix=$INSTALLROOT
}
