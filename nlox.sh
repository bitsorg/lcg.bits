package: nlox
description: NLox one-loop matrix element provider library
version: "1.2.2.atlas7"
tag: "1.2.2.atlas7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/nlox-1.2.2.atlas7.tar.gz
build_requires:
  - bits-recipe-tools
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  $SHELL -c "sed -i \
     -e 's/set(NLOX_PROCESSES [^)]*)/' \
'set(NLOX_PROCESSES pp_Wpttbar pp_Zttbar_as3ae1 pp_ttbarepem_as3ae2 pp_Wmttbar)/' \
     -e 's|helac-phegas/tar-files|tar-files|' \
     $SOURCEDIR/CMakeLists.txt"
  cmake $SOURCEDIR \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DBUILD_SHARED_LIBS=ON \
    -DNLOX_PROCESSES_URL=https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/nlox/downloads/processes/v1.2.0/ \
    -DNLOX_ENABLE_QCDLOOP2=OFF \
    -DNLOX_ENABLE_QCDLOOP=ON
}
