package: flex
description: flex fast lexical analyser generator
version: "2.6.4"
tag: "2.6.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - bison
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: libfl.dylib is built from libmain.o, whose main() references yylex --
  # a symbol libfl deliberately leaves undefined (the consumer's generated
  # scanner provides it). Linux's flat namespace permits the undefined symbol in
  # the dylib; macOS's two-level namespace rejects it ("Undefined symbols for
  # architecture arm64: _yylex"). Allow flat-namespace lazy resolution so libfl
  # links, matching the ELF behaviour.
  [ "$(uname)" = Darwin ] && export LDFLAGS="-Wl,-undefined,dynamic_lookup${LDFLAGS:+ ${LDFLAGS}}"
  # macOS: configure detects the reallocarray() *symbol* (it links) and sets
  # HAVE_REALLOCARRAY, so misc.c calls the system reallocarray -- but the current
  # macOS SDK does not *declare* it in <stdlib.h> (not even under
  # _DARWIN_C_SOURCE), so clang errors "call to undeclared function
  # 'reallocarray'". Force HAVE_REALLOCARRAY off so flex uses its own bundled
  # overflow-checked fallback (flexdef.h declares it; misc.c has the #else path)
  # and never touches the undeclared system one. No effect on Linux (glibc
  # declares reallocarray).
  [ "$(uname)" = Darwin ] && export ac_cv_func_reallocarray=no
  # Build in-source (AutoToolsRecipe rsyncs the source into cwd), matching
  # lcgcmake's flex (configure --prefix; make; make install; BUILD_IN_SOURCE).
  ./configure --prefix="$INSTALLROOT"
}
