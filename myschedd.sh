package: myschedd
description: myschedd HTCondor schedd configuration utility
version: "1.9-2"
tag: "1.9-2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - go
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  # go 1.12.5 builds in GOPATH mode, and myschedd imports its own
  # gitlab.cern.ch/batch-team/myschedd/cmd package, so the source must sit at
  # $GOPATH/src/<import-path> for the self-import to resolve. The unpacked
  # tarball is a bare directory, so stage it into a throwaway GOPATH and build
  # from there (GO111MODULE=off keeps 1.12 in classic GOPATH mode).
  local ip="gitlab.cern.ch/batch-team/myschedd"
  local out="$PWD/myschedd" gp
  gp="$(mktemp -d)"
  export GOPATH="$gp" GO111MODULE=off
  mkdir -p "$GOPATH/src/$(dirname "$ip")"
  cp -a "$PWD" "$GOPATH/src/$ip"
  ( cd "$GOPATH/src/$ip" && GODEBUG=netdns=cgo go build -o "$out" )
}

function MakeInstall() {
  # myschedd has no 'install' target; install the go-built binary so the
  # MakeRecipe default (make install) is not used.
  mkdir -p "$INSTALLROOT/bin"
  cp -p myschedd "$INSTALLROOT/bin/"
}
