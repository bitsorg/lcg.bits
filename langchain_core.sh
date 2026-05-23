package: langchain_core
description: LangChain core abstractions and primitives
version: "0.3.29"
tag: "0.3.29"
requires:
  - Python
  - langsmith
  - packaging
  - anyio
  - jsonpatch
  - PyYAML
  - tenacity
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