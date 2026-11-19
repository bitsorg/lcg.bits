package: libedit
description: libedit command-line editing library
version: "3.1"
source: https://github.com/troglobit/editline
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # gcc 15 defaults to C23, where empty '()' means "no arguments". libedit 3.1's
  # examples use K&R forward declarations then call them with args - a hard error
  # under C23. Build as C17 to restore pre-C23 empty-paren semantics.
  ./configure --prefix "$INSTALLROOT" CFLAGS="${CFLAGS:-} -std=gnu17"
}
