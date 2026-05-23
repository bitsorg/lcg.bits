package: readline
description: GNU Readline command-line editing and history library
version: "8.3"
tag: "8.3"
sources:
  - ftp://ftp.cwru.edu/pub/bash/%(name)s-%(version)s.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
