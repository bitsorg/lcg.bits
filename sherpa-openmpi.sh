package: sherpa-openmpi
description: Sherpa Monte Carlo event generator built with OpenMPI
version: "2.2.11p2.openmpi3"
mem_per_job: 1500
tag: "2.2.11p2.openmpi3"
sources:
  # The "p2"/".openmpi3" are LCG patch/build labels, not part of the upstream
  # filename — the hosted tarball is SHERPA-MC-2.2.11.tar.gz (same source as the
  # regular sherpa recipe); OpenMPI is enabled at build time, not a separate source.
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/SHERPA-MC-2.2.11.tar.gz
requires:
  - lhapdf
  - openmpi
  - fastjet
  - openloops
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
patches:
  - sherpa-2.2.11p2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Mirror the (working) sherpa recipe, but enable MPI. The previous recipe
  # used MakeRecipe and only overrode Make(), so ./configure never ran and
  # there was no Makefile ("No targets specified and no makefile found").

  # Exclude building Manual (requires LaTeX)
  sed -i.bak '/Manual/d' Makefile.am 2>/dev/null || true
  rm -f Makefile.am.bak

  autoreconf -ivf

  # Sherpa's configure uses wget; provide a curl-based shim. Put OpenMPI first
  # so configure picks up mpic++ for the MPI build.
  mkdir -p fakewget
  printf '#!/bin/sh\nexec curl -fO "$1"\n' > fakewget/wget
  chmod +x fakewget/wget
  export PATH="${OPENMPI_ROOT}/bin:$PWD/fakewget:$PATH"

  ./configure --prefix="$INSTALLROOT" \
    --enable-mpi \
    ${LHAPDF_ROOT:+--enable-lhapdf=$LHAPDF_ROOT} \
    ${FASTJET_ROOT:+--enable-fastjet=$FASTJET_ROOT} \
    ${OPENLOOPS_ROOT:+--enable-openloops=$OPENLOOPS_ROOT}
}

function Make() {
  make ${JOBS:+-j $JOBS} \
    "LDFLAGS=-L${OPENMPI_ROOT}/lib -lmpi -lmpi_cxx" \
    PATH="${OPENMPI_ROOT}/bin:$PATH" \
    LIBRARY_PATH="${LHAPDF_ROOT}/lib" \
    LD_LIBRARY_PATH="${OPENMPI_ROOT}/lib:${OPENMPI_ROOT}/lib/openmpi:$LD_LIBRARY_PATH"
}

function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv SHERPA_ROOT $PKG_ROOT
setenv SHERPA_INSTALL_PATH $PKG_ROOT/lib/SHERPA-MC
setenv SHERPA_SHARE_PATH $PKG_ROOT/share/SHERPA-MC
EOF
}
