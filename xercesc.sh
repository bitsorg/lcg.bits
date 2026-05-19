package: XercesC
description: Apache Xerces-C++ XML parser library
version: "3.3.0"
tag: "3.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xerces-c-3.3.0.tar.gz
requires:
  - curl
  - #
prefer_system: osx.*
prefer_system_check: |
  pkg-config --atleast-version=3.2.0 xerces-c 2>&1 && printf "#include <xercesc/util/PlatformUtils.hpp>" | c++ -xc++ -I$(brew --prefix xerces-c)/include -c -

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT ${xerces_config_opts}
}
