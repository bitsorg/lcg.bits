package: gophernotes
description: Gophernotes Go kernel for Jupyter notebooks
version: "7c3ca4e"
tag: "7c3ca4e"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - go
  - pkg_config
  - zeromq
  - go_zmq4
  - go.uuid
  - go_liner
  - go_runewidth
  - gomacro
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() { :; }
function Make() {
  local gopath_src="${INSTALLROOT}/src/github.com/gopherdata/gophernotes"
  cmake -E make_directory "${INSTALLROOT}/bin" "${INSTALLROOT}/pkg" "${gopath_src}"
  cmake -E copy_directory "${SOURCEDIR}" "${gopath_src}"
  # GOPATH-based build: each Go dep package installs its source + compiled
  # archive under its own INSTALLROOT.  Assemble them all into GOPATH so that
  # 'go install' can find github.com/cosmos72/gomacro, github.com/pebbe/zmq4,
  # github.com/satori/go.uuid, etc.
  export GOROOT="${GO_ROOT}"
  export GOPATH="${INSTALLROOT}\
${GOMACRO_ROOT:+:${GOMACRO_ROOT}}\
${GO_ZMQ4_ROOT:+:${GO_ZMQ4_ROOT}}\
${GO_UUID_ROOT:+:${GO_UUID_ROOT}}\
${GO_LINER_ROOT:+:${GO_LINER_ROOT}}\
${GO_RUNEWIDTH_ROOT:+:${GO_RUNEWIDTH_ROOT}}"
  # zmq4 uses cgo — make sure its headers/libs are visible to the compiler.
  export CGO_CFLAGS="${ZEROMQ_ROOT:+-I${ZEROMQ_ROOT}/include}"
  export CGO_LDFLAGS="${ZEROMQ_ROOT:+-L${ZEROMQ_ROOT}/lib}"
  export PKG_CONFIG_PATH="${ZEROMQ_ROOT:+${ZEROMQ_ROOT}/lib/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}}"
  PATH="${GO_ROOT}/bin:${PATH}" go install github.com/gopherdata/gophernotes
}
function MakeInstall() { :; }
