package: go.uuid
description: go.uuid Go UUID generation and parsing library
version: "b2ce238"
source: https://github.com/satori/go.uuid
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - go
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function MakeInstall() {
  local gopath_src="$INSTALLROOT/src/github.com/satori/go.uuid"
  install -dm755 "$gopath_src"
  cp -a *.go go.mod "$gopath_src/" 2>/dev/null || true
  export GOPATH="$INSTALLROOT"
  export GOROOT="${GO_ROOT}"
  PATH="${GO_ROOT}/bin:$PATH" go install github.com/satori/go.uuid 2>/dev/null || true
}
