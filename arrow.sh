package: arrow
description: Apache Arrow cross-language columnar in-memory data format
version: "23.0.1"
tag: "23.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/apache-arrow-23.0.1.tar.gz
requires:
  - Boost
  - Python
  - numpy
  - flatbuffers
  - thrift
  - brotli
  - double_conversion
  - glog
  - gflags
  - rapidjson
  - lz4
  - snappy
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
