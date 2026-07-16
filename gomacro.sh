package: gomacro
description: Gomacro Go interpreter with generics/macro support
version: "c9f381e"
source: https://github.com/cosmos72/gomacro
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - go
  - go_liner
  - go_runewidth
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MPL-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() { :; }
function Make() {
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/pkg $INSTALLROOT/src/github.com/cosmos72/gomacro/
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/src/github.com/cosmos72/gomacro/
  if bits_is_macos; then
    # macOS Go runs GOPATH mode and defaults to ~/go; point GOPATH at INSTALLROOT plus the go_* dep roots
    export GOROOT="${GO_ROOT}"
    export GOPATH="${INSTALLROOT}${GO_LINER_ROOT:+:${GO_LINER_ROOT}}${GO_RUNEWIDTH_ROOT:+:${GO_RUNEWIDTH_ROOT}}"
    ( cd "$INSTALLROOT/src/github.com/cosmos72/gomacro/" && PATH="${GO_ROOT}/bin:${PATH}" go install )
  else
    cmake -E chdir $INSTALLROOT/src/github.com/cosmos72/gomacro/ go install
  fi
}
function MakeInstall() { :; }
