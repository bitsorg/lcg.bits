package: adaptyst
description: Adaptyst performance profiling framework (CERN)
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/adaptyst-HEAD.tar.gz
requires:
  - Boost
  - jsonmcpp
  - poco
  - cli11
  - libarchive
  - libbpf
  - libnuma
  - libtraceevent
  - flex
  - bison
  - Python
  - perf
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DADAPTYST_SCRIPT_PATH=$INSTALLROOT/share/adaptyst \
    -DADAPTYST_CONFIG_PATH=$INSTALLROOT/etc/adaptyst.conf \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DPERF_DIR=${perf_ROOT}
}
