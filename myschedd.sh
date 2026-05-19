package: myschedd
description: myschedd HTCondor schedd configuration utility
version: "1.9-2"
tag: "1.9-2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/myschedd-1.9-2.tar.gz
requires:
  - go
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  "" GODEBUG=netdns=cgo go build
}
