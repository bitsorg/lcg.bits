package: pprof
description: pprof tool for profiling and visualization of Go programs
version: "54271f7"
tag: "54271f7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pprof-54271f7.tar.gz
requires:
  - go
  - graphviz
  - go_readline
  - go_demangle
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/pkg $INSTALLROOT/src/github.com/google/pprof
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/src/github.com/google/pprof
  cmake -E chdir $INSTALLROOT/src/github.com/google/pprof go install
}
