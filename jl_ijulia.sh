package: jl_ijulia
description: jl_ijulia library/tool (from LCG software stack)
version: "1.29.0"
tag: "1.29.0"
requires:
  - julia
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
  julia $BUILDDIR/install-packages.jl
}
