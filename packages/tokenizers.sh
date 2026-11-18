package: tokenizers
description: Hugging Face Tokenizers fast tokenization library (Rust)
version: "0.22.1"
tag: "0.22.1"
requires:
  - Python
  - huggingface_hub
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################