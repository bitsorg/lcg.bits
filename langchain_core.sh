package: langchain_core
description: LangChain core abstractions and primitives
version: "1.2.22"
tag: "1.2.22"
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