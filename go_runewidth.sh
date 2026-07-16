package: go_runewidth
description: runewidth Go library for calculating rune widths
version: "703b5e6"
source: https://github.com/mattn/go-runewidth
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
  # Install Go source into GOPATH workspace layout so downstream packages
  # can 'go build' or 'go install' this library.
  local gopath_src="$INSTALLROOT/src/github.com/mattn/go-runewidth"
  install -dm755 "$gopath_src"
  cp -a *.go go.mod "$gopath_src/" 2>/dev/null || true

  # Pre-compile for the host platform
  export GOPATH="$INSTALLROOT"
  export GOROOT="${GO_ROOT}"
  PATH="${GO_ROOT}/bin:$PATH" go install github.com/mattn/go-runewidth 2>/dev/null || true
}
