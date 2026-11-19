package: cpymad
description: cpymad Python bindings to MAD-X
version: "1.19.0"
tag: "1.19.0"
requires:
  - Python
  - cython
  - numpy
  - minrpc
  - madx
  - importlib_resources
  - zipp
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
# cpymad itself is Apache-2.0; the linked MAD-X was verified MIT / open source
# under CERN copyright by the 2026-07-16 license review (see madx.sh), retiring
# the old LicenseRef-MAD-X restriction.
license: Apache-2.0
acknowledgment: "MAD-X is CERN Copyright - MIT License."
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################