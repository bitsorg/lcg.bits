package: langchain_text_splitters
description: LangChain text splitting utilities
version: "0.3.5"
tag: "0.3.5"
requires:
  - Python
  - langchain_core
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