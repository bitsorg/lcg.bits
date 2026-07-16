package: blosc
description: Python-Blosc high-performance compressor bindings
version: "1.11.4"
source: https://github.com/Blosc/python-blosc
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - wheel
  - scikitbuild
  - CMake
  - ninja
  - numpy
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # Remove C99 bool typedef that conflicts with C23's built-in bool (GCC 15).
  # The typedef was in c-blosc's shuffle.c; find it regardless of exact path.
  find . -name "shuffle.c" -path "*/c-blosc/*" -exec \
    perl -i -ne 'print unless /typedef.*_Bool.*bool/../typedef unsigned char bool/' {} +
}