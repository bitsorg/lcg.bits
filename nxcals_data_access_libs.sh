package: nxcals_data_access_libs
description: nxcals_data_access_libs library/tool (from LCG software stack)
version: ""${NXCALS_JAVA_VERSION}""
tag: ""${NXCALS_JAVA_VERSION}""
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS}
  cmake -E copy_directory $SOURCEDIR/nxcals $INSTALLROOT/nxcals/nxcals_java
}
