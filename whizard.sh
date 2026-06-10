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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# WHIZARD's circe2 is OCaml; without CAMLLIB the compiler can't find its stdlib
# ("Unbound module Stdlib"). Export at recipe scope so configure and make see it.
export CAMLLIB="${OCAML_ROOT}/lib/ocaml"
##############################
# WHIZARD's bundled contrib/mcfio includes <rpc/types.h>, dropped from glibc and
# now provided by libtirpc-dev. Add its flags only when pkg-config sees libtirpc:
# a bare unconditional -ltirpc poisons LDFLAGS and breaks configure's compiler probe.
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
  # macOS: HepMC3's ROOT interface makes whizard compile HepMC3Wrap.cpp against
  # ROOT v6.40 headers, which don't build under Apple clang 21. ROOT is only needed
  # for the optional RootTree writer, so force the rootIO probe off (uses Ascii/HEPEVT).
  bits_is_macos && bits_file_replace configure \
    'if ${hepmcconfig} --rootIO | grep rootIO >/dev/null 2>&1; then' 'if false; then'
  LCIO_DIR=${LCIO_ROOT} LOOPTOOLS_DIR=${LOOPTOOLS_ROOT}/lib64 LHAPDF_DATA_PATH=$INSTALLROOT/tmppdfsets \
    HOPPET_DIR=${HOPPET_ROOT} LHAPDF_DIR=${LHAPDF_ROOT} HEPMC_DIR=${HEPMC3_ROOT} \
    ./configure --enable-hepmc --enable-fastjet --with-fastjet=${FASTJET_ROOT} \
      --enable-hoppet --enable-gosam --with-gosam=${GOSAM_ROOT}/bin \
      --enable-looptools \
      ${OPENLOOPS_ROOT:+--enable-openloops --with-openloops=${OPENLOOPS_ROOT}} \
      --prefix=$INSTALLROOT
}