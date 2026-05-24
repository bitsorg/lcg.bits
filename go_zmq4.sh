package: go_zmq4
description: zmq4 Go ZeroMQ (ZMQ4) bindings
version: "7a493a6"
tag: "7a493a6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - go
  - zeromq
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function MakeInstall() {
  local gopath_src="${INSTALLROOT}/src/github.com/pebbe/zmq4"
  install -dm755 "${gopath_src}"
  cp -a "${SOURCEDIR}"/. "${gopath_src}/"
  export GOPATH="${INSTALLROOT}"
  export GOROOT="${GO_ROOT}"
  # zmq4.go uses `#cgo pkg-config: libzmq` so pkg-config must be able to
  # find libzmq.pc regardless of CGO_CFLAGS/CGO_LDFLAGS.
  export PKG_CONFIG_PATH="${ZEROMQ_ROOT}/lib/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
  export CGO_CFLAGS="-I${ZEROMQ_ROOT}/include"
  export CGO_LDFLAGS="-L${ZEROMQ_ROOT}/lib"
  PATH="${GO_ROOT}/bin:${PATH}" go install github.com/pebbe/zmq4
}
