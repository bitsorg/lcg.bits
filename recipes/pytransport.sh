package: pytransport
description: PyTransport numerical transport equation solver for inflation
version: "2.0.2"
tag: "2.0.2"
requires:
  - Python
  - numpy
  - matplotlib
  - scipy
  - importlib_metadata
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-PyTransport
# Redistribution cleared: Key4hep already distributes it on CVMFS (2026-10-19).
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################