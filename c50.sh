package: C50
description: C5.0 decision tree algorithm Python bindings
version: "2.07"
tag: "2.07"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # bits stores the raw tarball when strip-level detection fails; extract manually.
  local tgz="C50-2.07.tar.gz"
  if [ -f "${tgz}" ]; then
    local prefix
    prefix=$(tar tzf "${tgz}" | head -1 | cut -d/ -f1)
    if tar tzf "${tgz}" | grep -q "^${prefix}/"; then
      tar xzf "${tgz}" --strip-components=1
    else
      tar xzf "${tgz}"
    fi
    rm -f "${tgz}"
  fi
  # Makefile: remove csh dependency (not available on modern systems)
  find . -name Makefile -exec perl -i -pe 's|^SHELL  = /bin/csh$|#SHELL  = /bin/csh|' {} \;
  # report.c: add headers required by GCC 15 (implicit declarations are errors)
  find . -name report.c -exec perl -i -pe '$_ .= "#include <ctype.h>\n#include <string.h>\n" if m{#include <stdlib\.h>}' {} \;
  # macOS/clang: finite() (obsolete BSD) was removed from macOS <math.h>; glibc
  # still declares it, but clang errors on the implicit declaration AND the
  # symbol does not exist at link time. c50gt.c/getdata.c/subset.c use it. Map
  # finite -> the C99 isfinite() macro on the Makefile's $(CC) (used by both the
  # c5.0 target and the .c.o rule). No-op on Linux (Darwin-gated).
  if [ "$(uname)" = Darwin ]; then
    find . -name Makefile -exec perl -i -pe 's{^(CC\s*=\s*gcc)}{$1 -Dfinite=isfinite}' {} \;
  fi
}

function Make() {
  make ${JOBS:+-j $JOBS}
  make ${JOBS:+-j $JOBS}
}

function MakeInstall() {
  install -dm755 "$INSTALLROOT/bin"
  install -m755 c5.0 report "$INSTALLROOT/bin/"
}
