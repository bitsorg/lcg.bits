package: sqlite
description: SQLite self-contained SQL database engine library
version: "3320300"
tag: "3320300"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sqlite-autoconf-3320300.tar.gz
prefer_system: ".*"
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
  ./configure --prefix=$INSTALLROOT "CPPFLAGS=${CPPFLAGS} -DSQLITE_ENABLE_COLUMN_METADATA=1"
}
