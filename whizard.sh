package: whizard
description: WHIZARD Monte Carlo event generator for multi-parton processes
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/whizard-unknown.tar.gz
requires:
  - ocaml
  - lhapdf
  - looptools
  - hoppet
  - hepmc3
  - fastjet
  - gosam
  - gosam_contrib
  - FORM
  - autoconf
  - automake
  - libtool
  - LCIO
  - openloops
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  cmake -E make_directory $INSTALLROOT/tmppdfsets
  ${lhapdf_ROOT}/bin/lhapdf --pdfdir=$INSTALLROOT/tmppdfsets --listdir=${lhapdf_ROOT}/share/LHAPDF install cteq6l1 CT10
  LCIO_DIR=${LCIO_ROOT} LOOPTOOLS_DIR=${looptools_ROOT}/lib64 LHAPDF_DATA_PATH=$INSTALLROOT/tmppdfsets \
    HOPPET_DIR=${hoppet_ROOT} LHAPDF_DIR=${lhapdf_ROOT} HEPMC_DIR=${hepmc3_ROOT} \
    ./configure --enable-hepmc --enable-fastjet --with-fastjet=${fastjet_ROOT} \
      --enable-hoppet --enable-gosam --with-gosam=${gosam_ROOT}/bin \
      --enable-looptools --enable-openloops --with-openloops=${openloops_ROOT} \
      --prefix=$INSTALLROOT
}