package: pexpect
description: Pexpect controlling interactive console applications
version: "4.9.0"
source: https://github.com/pexpect/pexpect
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - ptyprocess
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: ISC
patches:
  - pexpect-4.9.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################