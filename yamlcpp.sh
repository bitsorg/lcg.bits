package: yamlcpp
description: yaml-cpp YAML parser and emitter library for C++
version: "0.6.3"
tag: "0.6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/yaml-cpp-0.6.3.tar.gz
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
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DYAML_BUILD_SHARED_LIBS=ON
}
