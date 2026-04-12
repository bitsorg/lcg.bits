package: sqlite
description: SQLite self-contained SQL database engine library
version: "3320300"
tag: "3320300"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sqlite-autoconf-3320300.tar.gz
build_requires:
  - bits-recipe-tools
license: blessing
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT "CPPFLAGS=${CPPFLAGS} -DSQLITE_ENABLE_COLUMN_METADATA=1"
}
