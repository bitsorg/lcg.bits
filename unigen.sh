package: unigen
description: UniGen universal Monte Carlo event format and library
version: "2.2"
tag: "2.2"
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
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  # base/include/UEvent.h forward-declares `class TString;` but uses
  # `TString fComment;` as a field, which is illegal for an incomplete type. It
  # used to compile only because TLorentzVector.h pulled in TString.h
  # transitively; ROOT v6.40 (notably under Apple clang) no longer does, so
  # rootcling fails ("field has incomplete type 'TString'") and libUniGen — plus
  # everything that links it (libTasks, the *2u executables: "library 'UniGen'
  # not found") — fails to build. Include TString.h so the type is complete
  # regardless of transitive includes. Idempotent; on Linux TString.h was
  # already included transitively, so the result is unchanged there.
  if grep -q '^class TString;' base/include/UEvent.h 2>/dev/null; then
    perl -i -pe 's{^class TString;}{#include "TString.h"}' base/include/UEvent.h
  fi
  make ${JOBS:+-j $JOBS}
  make ${JOBS:+-j $JOBS} DESTDIR=$INSTALLROOT install
}
function MakeInstall() { true; }
