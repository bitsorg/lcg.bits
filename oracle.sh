package: oracle
description: Oracle Database server
version: "19.19.0.0.0"
tag: "19.19.0.0.0"
requires:
  - libaio
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-Oracle
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
. $(bits-include BitsArch)
##############################
MODULE_OPTIONS=""
##############################
function Prepare() {
  local ora_arch; ora_arch="linux.$(bits_arch_select x64 arm64)"
  local tgz="${PKGNAME}-${PKGVERSION}-${ora_arch}.tar.gz"
  curl -fSL "https://lcgpackages.web.cern.ch/tarFiles/sources/${tgz}" -o "${tgz}"
  tar xzf "${tgz}"
  rm -f "${tgz}"
}
