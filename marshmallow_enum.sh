package: marshmallow_enum
description: marshmallow-enum Enum field for marshmallow
version: "1.5.1"
tag: "1.5.1"
requires:
  - Python
  - marshmallow
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################