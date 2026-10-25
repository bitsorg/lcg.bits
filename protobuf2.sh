package: protobuf2
description: Protocol Buffers v2 serialization library (ATLAS NSW legacy ABI)
version: "5.29.6"
tag: "5.29.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/protobuf-2.5.0.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
references:
  - cpe:2.3:a:google:protobuf:%(version)s
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  ./configure --prefix="$INSTALLROOT" CC=$CC CXX=$CXX
}
