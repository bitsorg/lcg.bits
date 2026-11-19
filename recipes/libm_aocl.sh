package: libm_aocl
description: AMD Optimizing CPU Libraries math functions (pre-built)
version: "3.1.0"
tag: "3.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/aocl-libm-linux-gcc-3.1.0.tar.gz
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--lib"
##############################
function MakeInstall() {
  install -dm755 "$INSTALLROOT/lib" "$INSTALLROOT/include"
  cp -a lib/*.so lib/*.a "$INSTALLROOT/lib/"
  cp -a include/* "$INSTALLROOT/include/"
}
