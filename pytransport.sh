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
# academic-use licence with no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: false
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################