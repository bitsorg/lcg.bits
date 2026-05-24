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
##############################
MODULE_OPTIONS=""
##############################
function Prepare() {
  case "$(uname -m)" in
    x86_64)  ora_arch="linux.x64" ;;
    aarch64) ora_arch="linux.arm64" ;;
    *)       echo "Unsupported architecture: $(uname -m)"; exit 1 ;;
  esac
  local tgz="${PKGNAME}-${PKGVERSION}-${ora_arch}.tar.gz"
  curl -fSL "https://lcgpackages.web.cern.ch/tarFiles/sources/${tgz}" -o "${tgz}"
  tar xzf "${tgz}"
  rm -f "${tgz}"
}
