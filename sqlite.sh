package: sqlite
description: SQLite self-contained SQL database engine library
version: "3320300"
tag: "3320300"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sqlite-autoconf-3320300.tar.gz
# Build sqlite as a real LCG external on Linux: ATLAS find_package(SQLite3) via
# AtlasLCG needs SQLITE_LCGROOT from the lcg-view, and a system /usr/include
# passed as -isystem breaks libstdc++ #include_next <stdlib.h>. Keep system on osx.
prefer_system: "osx.*"
prefer_system_check: |
  printf '#include <sqlite3.h>\nint main(){}\n' | cc -xc - -lsqlite3 -o /dev/null;
  if [ $? -ne 0 ]; then printf "SQLite not found.\n * On RHEL-compatible systems: sqlite sqlite-devel\n * On Ubuntu-compatible systems: libsqlite3-0 libsqlite3-dev\n"; exit 1; fi

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: blessing
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT "CPPFLAGS=${CPPFLAGS} -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_ENABLE_DESERIALIZE=1 -DSQLITE_ENABLE_FTS3=1 -DSQLITE_ENABLE_FTS4=1 -DSQLITE_ENABLE_FTS5=1 -DSQLITE_ENABLE_RTREE=1 -DSQLITE_ENABLE_MATH_FUNCTIONS=1"
}
