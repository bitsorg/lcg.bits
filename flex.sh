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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: libfl.dylib references yylex, which libfl deliberately leaves
  # undefined (the consumer's generated scanner provides it). macOS's two-level
  # namespace rejects it, so allow flat-namespace lazy resolution.
  bits_is_macos && export LDFLAGS="$(bits_macos_undefined_ldflags)${LDFLAGS:+ ${LDFLAGS}}"
  # macOS: configure finds the reallocarray() symbol and sets HAVE_REALLOCARRAY,
  # but the SDK doesn't declare it in <stdlib.h>, so clang errors on the
  # undeclared call. Force it off so flex uses its bundled fallback.
  bits_is_macos && export ac_cv_func_reallocarray=no
  # Build in-source (AutoToolsRecipe rsyncs the source into cwd), matching
  # lcgcmake's flex (configure --prefix; make; make install; BUILD_IN_SOURCE).
  ./configure --prefix="$INSTALLROOT"
}
