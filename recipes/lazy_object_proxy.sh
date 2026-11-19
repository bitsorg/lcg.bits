package: lazy_object_proxy
description: lazy-object-proxy fast and thorough lazy object proxy
version: "1.10.0"
tag: "1.10.0"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################