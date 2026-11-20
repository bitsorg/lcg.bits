package: dataclasses_json
description: dataclasses-json serialize dataclasses to/from JSON
version: "0.5.8"
tag: "0.5.8"
requires:
  - Python
  - marshmallow
  - marshmallow_enum
  - typing_inspect
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