package: GENIE
description: Comprehensive Monte Carlo neutrino event generator
version: "2.12.6"
tag: "2.12.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.bz2
requires:
  - ROOT
  - ROOTEGPythia6
  - lhapdf
  - pythia6
  - log4cpp
  - GSL
  - libxml2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# GENIE's generated Makefiles reference $GENIE (the source root) and need ROOT
# in ROOTSYS/PATH. These must be set for the build and install steps too -- the
# old Configure set GENIE only inside its `$SHELL -c` subshell, so `make` ran
# with $GENIE unset and looked for /src/make/Make.include. Export at recipe
# scope; bits runs every phase in the same build directory ($PWD).
export GENIE="$PWD"
export ROOTSYS="${ROOT_ROOT}"
export PATH="${ROOT_ROOT}/bin:$PATH"
##############################
function Configure() {
  # GENIE 2.12.6 predates Apple Silicon: `root-config --arch` returns
  # macosxarm64, which none of Make.include's ARCH blocks match, so ObjSuf/SrcSuf
  # stay empty and dictionary deps collapse to 'Class.' (No rule to make target).
  # Map it onto the macosx64 block. No-op on Linux.
  # shellcheck disable=SC2016
  perl -i -pe 's{\$\(shell root-config --arch\)}{\$(subst macosxarm64,macosx64,\$(shell root-config --arch))}g' \
    "$GENIE/src/make/Make.include"

  # ROOT >6.30 removed TPythia6/TMCParticle and libEGPythia6, which GENIE 2.12.6
  # includes and links. The ROOTEGPythia6 package re-provides them; point GENIE's
  # ROOT include/lib flags at it so TPythia6.h and -lEGPythia6 resolve.
  # shellcheck disable=SC2016
  perl -i -pe 's{-I\$\(shell root-config --incdir\)}{-I\$(shell root-config --incdir) -I\$(ROOTEGPYTHIA6_ROOT)/include}g; s{-lMinuit -lGeom -lEG -lEGPythia6 -lGenVector}{-L\$(ROOTEGPYTHIA6_ROOT)/lib -lMinuit -lGeom -lEG -lEGPythia6 -lGenVector}g;' \
    "$GENIE/src/make/Make.include"

  ./configure --prefix="$INSTALLROOT" --enable-lhapdf --enable-validation-tools \
    --enable-test --enable-numi --enable-atmo --enable-nucleon-decay --enable-rwght \
    --enable-pythia6 --enable-mathmore \
    --with-pythia6-lib=${PYTHIA6_ROOT}/lib \
    --with-lhapdf-lib=${LHAPDF_ROOT}/lib --with-lhapdf-inc=${LHAPDF_ROOT}/include \
    --with-log4cpp-inc=${LOG4CPP_ROOT}/include --with-log4cpp-lib=${LOG4CPP_ROOT}/lib \
    --with-libxml2-lib=${LIBXML2_ROOT}/lib --with-libxml2-inc=${LIBXML2_ROOT}/include/libxml2
}
