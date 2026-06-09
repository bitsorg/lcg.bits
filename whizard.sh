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
  # Gated behind the `openloops` flavour (off by default); WHIZARD builds
  # without it when `--flavour openloops` is not given.
  - "openloops:(?openloops)"
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
# (Ubuntu 25.10 here) they are provided by the system libtirpc-dev package under
# /usr/include/tirpc. When libtirpc is present, add its include dir and library
# so mcfio compiles ("rpc/types.h: No such file or directory").
#
# IMPORTANT: only inject these flags when pkg-config can actually see libtirpc.
# A bare "-ltirpc" added unconditionally poisons LDFLAGS on a host without the
# package, so even configure's "can the C compiler create executables?" probe
# fails ("C compiler cannot create executables"). If libtirpc is missing we
# leave the flags alone and let mcfio surface the real "install libtirpc-dev"
# requirement rather than breaking every link.
if pkg-config --exists libtirpc 2>/dev/null; then
  _tirpc_cflags="$(pkg-config --cflags libtirpc)"
  _tirpc_libs="$(pkg-config --libs libtirpc)"
  export CPPFLAGS="${CPPFLAGS:-} ${_tirpc_cflags}"
  export CFLAGS="${CFLAGS:-} ${_tirpc_cflags}"
  export LDFLAGS="${LDFLAGS:-} ${_tirpc_libs}"
else
  echo "whizard: libtirpc not found via pkg-config; contrib/mcfio needs <rpc/types.h>." >&2
  echo "         Install the system package (Ubuntu/Debian: apt install libtirpc-dev)." >&2
fi
##############################
function Configure() {
  cmake -E make_directory $INSTALLROOT/tmppdfsets
  ${LHAPDF_ROOT}/bin/lhapdf --pdfdir=$INSTALLROOT/tmppdfsets --listdir=${LHAPDF_ROOT}/share/LHAPDF install cteq6l1 CT10
  # macOS: the HepMC3 in this stack is built with the ROOT interface, so
  # whizard's configure probe ("checking if HepMC3 is built with ROOT
  # interface... yes") defines HEPMC3_ROOTIO and compiles src/hepmc3/
  # HepMC3Wrap.cpp against ROOT v6.40 headers. Those headers do not compile under
  # Apple clang 21 / the macOS-26 SDK: TClass has std::atomic members whose copy
  # constructor is deleted (the same wall that gates RELAX), and HepMC3Wrap.cpp
  # is compiled without -std=c++17 so ROOT's "requires C++17" #error fires too.
  # whizard uses ROOT only for the optional HepMC3 RootTree event format, so
  # force the rootIO probe to "no" on Darwin: HepMC3Wrap.cpp then skips the
  # #ifdef HEPMC3_ROOTIO ROOT includes and whizard builds with the Ascii/HEPEVT
  # HepMC3 writers. Idempotent (the original test line is consumed). Linux keeps
  # full ROOT support.
  [ "$(uname)" = Darwin ] && perl -i -pe \
    's{^\s*if \$\{hepmcconfig\} --rootIO \| grep rootIO >/dev/null 2>&1; then}{   if false; then}' \
    configure
  LCIO_DIR=${LCIO_ROOT} LOOPTOOLS_DIR=${LOOPTOOLS_ROOT}/lib64 LHAPDF_DATA_PATH=$INSTALLROOT/tmppdfsets \
    HOPPET_DIR=${HOPPET_ROOT} LHAPDF_DIR=${LHAPDF_ROOT} HEPMC_DIR=${HEPMC3_ROOT} \
    ./configure --enable-hepmc --enable-fastjet --with-fastjet=${FASTJET_ROOT} \
      --enable-hoppet --enable-gosam --with-gosam=${GOSAM_ROOT}/bin \
      --enable-looptools \
      ${OPENLOOPS_ROOT:+--enable-openloops --with-openloops=${OPENLOOPS_ROOT}} \
      --prefix=$INSTALLROOT
}