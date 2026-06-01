package: conddbmysql
description: CondDB MySQL backend for conditions database access
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
