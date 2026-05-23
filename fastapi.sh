package: fastapi
description: FastAPI high-performance async web framework for APIs
version: "0.119.0"
tag: "0.119.0"
requires:
  - Python
  - pydantic
  - starlette
  - typing_extensions
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