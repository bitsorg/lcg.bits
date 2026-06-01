package: libedit
description: libedit command-line editing library
version: "3.1"
tag: "3.1"
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
  # gcc 15 defaults to C23, where an empty parameter list '()' means "no
  # arguments" (not the old K&R "unspecified"). libedit 3.1's examples
  # (examples/fileman.c) use K&R-style forward declarations and then call those
  # functions with arguments, which is a hard error under C23. Build as C17 to
  # restore the pre-C23 empty-paren semantics.
  ./configure --prefix "$INSTALLROOT" CFLAGS="${CFLAGS:-} -std=gnu17"
}
