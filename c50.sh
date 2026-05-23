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
  find . -name Makefile -exec sed -i 's|^SHELL  = /bin/csh$|#SHELL  = /bin/csh|' {} \;
  # report.c: add headers required by GCC 15 (implicit declarations are errors)
  find . -name report.c -exec sed -i '/#include <stdlib\.h>/a #include <ctype.h>\n#include <string.h>' {} \;
}

function Make() {
  make ${JOBS:+-j $JOBS}
  make ${JOBS:+-j $JOBS}
}

function MakeInstall() {
  install -dm755 "$INSTALLROOT/bin"
  install -m755 c5.0 report "$INSTALLROOT/bin/"
}
