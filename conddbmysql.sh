package: conddbmysql
description: CondDB MySQL backend for conditions database access
# The derived v0.9.7 tag does not exist upstream; track the default branch.
# (iLCSoft/CondDBMySQL is a legacy repo on 'master'; flip to 'main' if checkout
# still fails.)
version: "master"
tag: "master"
source: https://github.com/iLCSoft/CondDBMySQL.git
requires:
  - CMake
  - mysql
  - ilcutil
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
