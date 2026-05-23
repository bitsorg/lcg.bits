package: tiktoken
description: tiktoken fast BPE tokenizer for OpenAI models
version: "0.12.0"
tag: "0.12.0"
requires:
  - Python
  - regex
  - requests
  - rust
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