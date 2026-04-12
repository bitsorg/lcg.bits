package: XercesC
description: Apache Xerces-C++ XML parser library
version: "3.3.0"
tag: "3.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xerces-c-3.3.0.tar.gz
requires:
  - curl
  - #
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  $SOURCEDIR/configure --prefix=$INSTALLROOT ${xerces_config_opts}
}
