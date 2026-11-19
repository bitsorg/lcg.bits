package: setuptools
description: setuptools Python packaging, build and distribution library
version: "84.1.0"
source: https://github.com/pypa/setuptools
tag: "v%(version)s"
# bits upgrade: no tarball of 84.1.0, built from the git tag
# sources:
#   - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
references:
  - pkg:pypi/setuptools@%(version)s
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
