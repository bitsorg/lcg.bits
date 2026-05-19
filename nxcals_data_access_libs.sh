package: nxcals_data_access_libs
description: NXCALS data access client libraries (CERN accelerator logging)
version: ""${NXCALS_JAVA_VERSION}""
tag: ""${NXCALS_JAVA_VERSION}""
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS}
  cmake -E copy_directory $SOURCEDIR/nxcals $INSTALLROOT/nxcals/nxcals_java
}
