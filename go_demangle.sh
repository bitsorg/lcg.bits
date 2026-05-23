package: go_demangle
description: go-demangle Go symbol demangling library and c++filt tool
version: "5e5cf60"
tag: "5e5cf60"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - go
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function MakeInstall() {
  local gopath_src="$INSTALLROOT/src/github.com/ianlancetaylor/demangle"
  install -dm755 "$gopath_src"
  cp -a *.go "$gopath_src/" 2>/dev/null || true
  [ -d testdata ] && cp -a testdata "$gopath_src/" || true

  # Pre-compile: library + c++filt binary (from c++filt.go main package)
  export GOPATH="$INSTALLROOT"
  export GOROOT="${GO_ROOT}"
  PATH="${GO_ROOT}/bin:$PATH" go install github.com/ianlancetaylor/demangle 2>/dev/null || true
  PATH="${GO_ROOT}/bin:$PATH" go build -o "$INSTALLROOT/bin/c++filt" \
    github.com/ianlancetaylor/demangle 2>/dev/null || true
}
