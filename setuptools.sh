package: setuptools
description: setuptools Python packaging, build and distribution library
version: "80.10.2"
tag: "80.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"

function MakeInstall() {
  mkdir -p "${SITE_PACKAGES}"
  # Bootstrap: pip is not yet available, install via setup.py.
  "${PYTHON_EXE}" setup.py install --root=/ --prefix="${INSTALLROOT}"
}
##############################
