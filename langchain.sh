package: langchain
description: LangChain framework for developing LLM-powered applications
version: "1.3.9"
tag: "1.3.9"
requires:
  - Python
  - pydantic
  - sqlalchemy
  - requests
  - PyYAML
  - numpy
  - anyio
  - aiohttp
  - async_timeout
  - numexpr
  - dataclasses_json
  - tenacity
  - jsonpatch
  - langsmith
  - langchain_core
  - langchain_text_splitters
  # optional:
  # - opensearch_py
  # - pypdf
  # - sentence_transformers
  # - openai
  # - faiss
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