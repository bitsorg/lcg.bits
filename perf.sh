package: perf
description: Linux perf performance analysis tool
version: "20250408"
tag: "20250408"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/linux-dev-20250408.tar.gz
requires:
  - libtraceevent
  - libbpf
  - flex
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
patches:
  - perf-20250408.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  ""/compile_perf.sh $INSTALLROOT COMPILE
  ""/compile_perf.sh $INSTALLROOT INSTALL
}
