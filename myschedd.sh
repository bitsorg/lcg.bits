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
  # myschedd is a Go modules project (go.mod/go.sum) with third-party deps and no
  # vendored tree, so it builds in module mode — GOPATH mode cannot resolve the
  # deps. go 1.12 resolves modules by direct VCS fetch, so this needs network:
  # github.com plus gitlab.cern.ch (negotiate, wtfis — both anonymously
  # readable); go.sum verifies integrity. Point the module cache at a writable
  # throwaway GOPATH, since the toolchain's own GOPATH may be read-only.
  export GO111MODULE=on
  export GOPATH="$(mktemp -d)"
  GODEBUG=netdns=cgo go build -o myschedd
}

function MakeInstall() {
  # myschedd has no 'install' target; install the go-built binary so the
  # MakeRecipe default (make install) is not used.
  mkdir -p "$INSTALLROOT/bin"
  cp -p myschedd "$INSTALLROOT/bin/"
}
