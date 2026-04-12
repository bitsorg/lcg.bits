package: langchain
description: langchain Python package
version: "0.3.14"
tag: "0.3.14"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/langchain-0.3.14.tar.gz
requires:
  - Python
  - pip
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################