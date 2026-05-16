package: xrootd_python
description: xrootd-python Python bindings for XRootD
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xrootd-python-unknown.tar.gz
requires:
  - Python
  - xrootd
build_requires:
  - bits-recipe-tools
license: LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################