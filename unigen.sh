package: unigen
description: UniGen universal Monte Carlo event format and library
version: "2.2"
source: https://github.com/FairRootGroup/UniGen
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
patches:
  - unigen-2.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  # UEvent.h forward-declares `class TString;` but uses it as a field (illegal
  # for an incomplete type); ROOT v6.40 no longer pulls TString.h in transitively,
  # so include it explicitly. Cross-platform; unchanged on Linux (already had it).
  bits_file_replace base/include/UEvent.h 'class TString;' '#include "TString.h"'
  # macOS: libTasks references libUniGen symbols meant to resolve at load time;
  # the two-level namespace rejects undefined symbols at link, so append
  # dynamic_lookup to the shared LDFLAGS (unless already present).
  if bits_is_macos; then
    perl -i -pe 's{^(LDFLAGS=.*)$}{$1 -Wl,-undefined,dynamic_lookup} unless /dynamic_lookup/' config/Makearch
  fi
  make ${JOBS:+-j $JOBS}
  make ${JOBS:+-j $JOBS} DESTDIR=$INSTALLROOT install
}
function MakeInstall() { true; }
