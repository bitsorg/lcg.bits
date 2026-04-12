package: igprof
description: igprof library/tool (from LCG software stack)
version: "5.9.18"
tag: "5.9.18"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/igprof-5.9.18.tar.gz
requires:
  - libunwind
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - igprof-5.9.18.patch
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
    -DCMAKE_CXX_STANDARD=14 \
    -DUNWIND_INCLUDE_DIR:PATH=${libunwind_ROOT}/include \
    -DUNWIND_LIBRARY:FILEPATH=${libunwind_ROOT}/lib/libunwind.so \
    -Wno-error=unused-result \
    -Wno-error=deprecated-declarations"
}
