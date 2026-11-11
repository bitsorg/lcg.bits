package: libgit2
description: libgit2 portable C implementation of Git core
version: "1.8.6"
source: https://github.com/libgit2/libgit2
tag: "v%(version)s"
# bits upgrade: no tarball of 1.8.6, built from the git tag
# sources:
#   - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only WITH GCC-exception-2.0
references:
  - cpe:2.3:a:libgit2:libgit2:%(version)s
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig --cmake"
##############################
