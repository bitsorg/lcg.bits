package: langsmith
description: LangSmith platform client for LLM observability
version: "0.8.18"
tag: "0.8.18"
requires:
  - Python
  - pydantic
  - requests
  - orjson
  - httpx
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