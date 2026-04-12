package: condor
description: condor library/tool (from LCG software stack)
version: "24.0.7"
tag: "24.0.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/condor-24.0.7-src.tar.gz
requires:
  - Boost
  - libxml2
  - linux_pam
  - libtool
  - c_ares
  - sqlite
  - pkg_config
  - Python
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - condor-24.0.7.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DHAVE_BACKFILL:BOOL=FALSE \
    -DHAVE_BOINC:BOOL=FALSE \
    -DHAVE_KBDD:BOOL=TRUE \
    -DHAVE_HIBERNATION:BOOL=TRUE \
    -DWANT_CONTRIB:BOOL=ON \
    -DWANT_MAN_PAGES:BOOL=TRUE \
    -DWANT_FULL_DEPLOYMENT:BOOL=FALSE \
    -DWANT_GLEXEC:BOOL=FALSE \
    -D_VERBOSE:BOOL=TRUE \
    -DBUILDID:STRING=LCG_"" \
    -DWITH_GLOBUS:BOOL=FALSE \
    -DWITH_VOMS:BOOL=FALSE \
    -DWITH_MUNGE:BOOL=FALSE \
    -DWITH_LIBCGROUP:BOOL=FALSE \
    -DWITH_SCITOKENS:BOOL=FALSE \
    -DWITH_LIBVIRT:BOOL=FALSE \
    -DBUILD_TESTING:BOOL=FALSE \
    -DPYTHON_EXECUTABLE=IGNORE \
    -DPYTHON3_EXECUTABLE=${Python_ROOT}/bin/python3 \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DBoost_INCLUDE_DIR=${Boost_ROOT}/include \
    -DBOOST_ROOT=${Boost_ROOT} \
    -DPython_ROOT_DIR=${Python_ROOT} \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON
}