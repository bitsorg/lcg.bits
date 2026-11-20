package: go_liner
description: liner Go readline-like library for command-line input
version: "6f820f8"
source: https://github.com/peterh/liner
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - go
  - go_runewidth
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function MakeInstall() {
  local gopath_src="${INSTALLROOT}/src/github.com/peterh/liner"
  install -dm755 "${gopath_src}"
  cp -a "${SOURCEDIR}"/. "${gopath_src}/"
  export GOPATH="${INSTALLROOT}"
  export GOROOT="${GO_ROOT}"
  export GOPATH="${GOPATH}:${GO_RUNEWIDTH_ROOT}"
  PATH="${GO_ROOT}/bin:${PATH}" go install github.com/peterh/liner
}
