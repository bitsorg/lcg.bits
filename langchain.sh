package: langchain
description: LangChain framework for developing LLM-powered applications
version: "0.3.14"
tag: "0.3.14"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/langchain-0.3.14.tar.gz
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################