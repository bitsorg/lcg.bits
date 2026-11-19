package: AIDA
description: Abstract Interfaces for Data Analysis (HEP histogram/tree interface)
version: "3.2.1"
source: https://github.com/bitslcg/AIDA.git
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/aida-3.2.1-src.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--inc"
##############################
function MakeInstall() {
  # FindAIDA looks for AIDA/AIDA.h under src/cpp. bits strips the top level of this
  # flat tarball (headers at cpp/); a checkout keeps src/cpp. Headers only.
  local d
  for d in src/cpp cpp; do [ -d "$d/AIDA" ] && break; done
  mkdir -p "$INSTALLROOT/src/cpp" && cp -r "$d/AIDA" "$INSTALLROOT/src/cpp/"
}
