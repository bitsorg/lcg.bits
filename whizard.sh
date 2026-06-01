package: whizard
description: WHIZARD Monte Carlo event generator for multi-parton processes
version: "3.1.8"
mem_per_job: 1500
tag: "3.1.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
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
patches:
  - whizard-3.1.8.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# WHIZARD's circe2 is written in OCaml; without CAMLLIB the OCaml compiler can't
# find its standard library and the build fails with "Unbound module Stdlib".
# lcgcmake sets CAMLLIB=${ocaml_home}/lib/ocaml as build ENVIRONMENT; export it
# at recipe scope so both configure and make see it.
export CAMLLIB="${OCAML_ROOT}/lib/ocaml"
##############################
# WHIZARD bundles StdHEP/mcfio (contrib/mcfio) whose XDR I/O includes
# <rpc/types.h>. glibc dropped the Sun RPC headers years ago; on modern distros
# (Ubuntu 25.10 here) they are provided by libtirpc under /usr/include/tirpc.
# Put the tirpc include dir on CPPFLAGS and link -ltirpc so mcfio compiles
# ("rpc/types.h: No such file or directory"). Requires the system libtirpc-dev
# package; prefer pkg-config and fall back to the conventional path.
_tirpc_cflags="$(pkg-config --cflags libtirpc 2>/dev/null || echo -I/usr/include/tirpc)"
_tirpc_libs="$(pkg-config --libs libtirpc 2>/dev/null || echo -ltirpc)"
export CPPFLAGS="${CPPFLAGS:-} ${_tirpc_cflags}"
export CFLAGS="${CFLAGS:-} ${_tirpc_cflags}"
export LDFLAGS="${LDFLAGS:-} ${_tirpc_libs}"
##############################
function Configure() {
  cmake -E make_directory $INSTALLROOT/tmppdfsets
  ${LHAPDF_ROOT}/bin/lhapdf --pdfdir=$INSTALLROOT/tmppdfsets --listdir=${LHAPDF_ROOT}/share/LHAPDF install cteq6l1 CT10
  LCIO_DIR=${LCIO_ROOT} LOOPTOOLS_DIR=${LOOPTOOLS_ROOT}/lib64 LHAPDF_DATA_PATH=$INSTALLROOT/tmppdfsets \
    HOPPET_DIR=${HOPPET_ROOT} LHAPDF_DIR=${LHAPDF_ROOT} HEPMC_DIR=${HEPMC3_ROOT} \
    ./configure --enable-hepmc --enable-fastjet --with-fastjet=${FASTJET_ROOT} \
      --enable-hoppet --enable-gosam --with-gosam=${GOSAM_ROOT}/bin \
      --enable-looptools --enable-openloops --with-openloops=${OPENLOOPS_ROOT} \
      --prefix=$INSTALLROOT
}