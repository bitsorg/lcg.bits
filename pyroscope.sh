package: pyroscope
description: Pyroscope continuous profiling platform
version: "1.12.0"
tag: "1.12.0"
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Prepare() {
  # Pre-built Go binary; arch-specific tarball must be downloaded at build time
  # because YAML sources: does not support shell variable expansion.
  case $(uname -m) in
    x86_64)  arch=amd64 ;;
    aarch64) arch=arm64 ;;
    *) echo "Unsupported architecture: $(uname -m)" >&2; exit 1 ;;
  esac
  local url="https://lcgpackages.web.cern.ch/tarFiles/sources/pyroscope_${PKGVERSION}_linux_${arch}.tar.gz"
  curl -fSL "$url" | tar -xz -C ./
}

function MakeInstall() {
  install -Dm755 pyroscope "$INSTALLROOT/bin/pyroscope"
}
