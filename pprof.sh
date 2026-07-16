package: pprof
description: pprof tool for profiling and visualization of Go programs
version: "54271f7"
source: https://github.com/google/pprof
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - go
  - graphviz
  - go_readline
  - go_demangle
  - go_liner
  - go_runewidth
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() { :; }
function Make() {
  local gopath_src="${INSTALLROOT}/src/github.com/google/pprof"
  cmake -E make_directory "${INSTALLROOT}/bin" "${INSTALLROOT}/pkg" "${gopath_src}"
  cmake -E copy_directory "${SOURCEDIR}" "${gopath_src}"
  export GOROOT="${GO_ROOT}"
  export GOPATH="${INSTALLROOT}\
${GO_READLINE_ROOT:+:${GO_READLINE_ROOT}}\
${GO_DEMANGLE_ROOT:+:${GO_DEMANGLE_ROOT}}\
${GO_LINER_ROOT:+:${GO_LINER_ROOT}}\
${GO_RUNEWIDTH_ROOT:+:${GO_RUNEWIDTH_ROOT}}"
  PATH="${GO_ROOT}/bin:${PATH}" go install github.com/google/pprof
}
function MakeInstall() { :; }
