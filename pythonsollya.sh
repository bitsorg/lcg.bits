package: pythonsollya
description: Python-Sollya Python interface to the Sollya library
version: "0.3"
tag: "0.3"
sources:
  # For versions < 0.4.0 the hosted tarball is pythonsollya-<ver>.tgz (the
  # "release-…tar.gz" naming only applies to >= 0.4.0-alpha0), per lcgcmake.
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pythonsollya-%(version)s.tgz
requires:
  - Python
  - cython
  - mpfi
  - sollya
  - six
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
patches:
  - pythonsollya-0.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################