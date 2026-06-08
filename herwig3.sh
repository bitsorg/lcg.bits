package: herwig3
description: Herwig 7 general-purpose Monte Carlo event generator
version: "7.3.0"
mem_per_job: 1500
tag: "7.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/Herwig-7.3.0.tar.bz2
requires:
  - thepeg
  - lhapdf
  - Boost
  - GSL
  - fastjet
  - vbfnlo
  # Gated behind the `openloops` flavour (off by default). The Configure body
  # already wraps --with-openloops in ${OPENLOOPS_ROOT:+...}, so Herwig builds
  # without it when the flavour is off.
  - "openloops:(?openloops)"
  - madgraph5amc
  - njet
  - gosam
  - gosam_contrib
  - Python
  - automake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
env:
  HERWIG3_ROOT: "$HERWIG3_ROOT"
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  [[ -n "$THEPEG_ROOT" ]] && export LD_LIBRARY_PATH="$THEPEG_ROOT/lib/ThePEG:$LD_LIBRARY_PATH"

  # Pre-install a minimal PDF set so configure tests can run
  mkdir -p "$INSTALLROOT/tmppdfsets"
  if [[ -n "$LHAPDF_ROOT" ]]; then
    "$LHAPDF_ROOT/bin/lhapdf" --pdfdir="$INSTALLROOT/tmppdfsets" \
      install MMHT2014lo68cl MMHT2014nlo68cl CT14lo CT14nlo || true
  fi

  autoreconf --force --install

  # aarch64 needs 64-bit integer Fortran interface
  local fcflags="-std=legacy"
  local fflags="-std=legacy"
  if [[ "$(uname -m)" == aarch64 ]]; then
    fcflags="$fcflags -fdefault-integer-8"
    fflags="$fflags -fdefault-integer-8"
  fi

  ./configure --prefix="$INSTALLROOT" \
    ${GSL_ROOT:+--with-gsl="$GSL_ROOT"} \
    ${THEPEG_ROOT:+--with-thepeg="$THEPEG_ROOT"} \
    ${THEPEG_ROOT:+--with-thepeg-headers="$THEPEG_ROOT/include"} \
    ${FASTJET_ROOT:+--with-fastjet="$FASTJET_ROOT"} \
    ${BOOST_ROOT:+--with-boost="$BOOST_ROOT"} \
    ${MADGRAPH5AMC_ROOT:+--with-madgraph="$MADGRAPH5AMC_ROOT"} \
    ${OPENLOOPS_ROOT:+--with-openloops="$OPENLOOPS_ROOT"} \
    ${GOSAM_CONTRIB_ROOT:+--with-gosam-contrib="$GOSAM_CONTRIB_ROOT"} \
    ${GOSAM_ROOT:+--with-gosam="$GOSAM_ROOT"} \
    ${NJET_ROOT:+--with-njet="$NJET_ROOT"} \
    ${VBFNLO_ROOT:+--with-vbfnlo="$VBFNLO_ROOT"} \
    "FCFLAGS=$fcflags" \
    "FFLAGS=$fflags"
}
function Make() {
  local fflags="-std=legacy"
  [[ "$(uname -m)" == aarch64 ]] && fflags="$fflags -fdefault-integer-8"
  make ${JOBS:+-j $JOBS} all "FFLAGS=$fflags"
  # Build FxFx matrix element interface if rivet is available
  if [[ -n "$RIVET_ROOT" ]]; then
    make -C MatrixElement/FxFx \
      PATH="$RIVET_ROOT/bin:$PATH" \
      HERWIGINCLUDE="-I../../include" \
      ${BOOST_ROOT:+BOOSTINCLUDE="-I$BOOST_ROOT/include"}
  fi
}
function MakeInstall() {
  make install LHAPDF_DATA_PATH="$INSTALLROOT/tmppdfsets"
  if [[ -n "$RIVET_ROOT" ]]; then
    make -C MatrixElement/FxFx HERWIGINSTALL="$INSTALLROOT" install
  fi
  rm -rf "$INSTALLROOT/tmppdfsets"
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv HERWIG3_ROOT $PKG_ROOT
EOF
}
