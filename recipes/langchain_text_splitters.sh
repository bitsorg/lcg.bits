package: langchain_text_splitters
description: LangChain text splitting utilities
version: "1.1.2"
tag: "1.1.2"
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