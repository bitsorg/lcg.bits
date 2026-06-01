package: conddbmysql
description: CondDB MySQL backend for conditions database access
version: "HEAD"
tag: "HEAD"
source: git+https://github.com/iLCSoft/CondDBMySQL.git?obj=master
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
