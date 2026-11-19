package: mille-sources
description: Mille source tree, built inside generalbrokenlines instead of fetched by its CMake
version: "V01-00-02"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mille-%(version)s.tar.gz
build_requires:
  - bits-recipe-tools
license: LGPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
# Sources only: BinaryRecipe copies the unpacked tree into $INSTALLROOT.
MODULE_OPTIONS=""
