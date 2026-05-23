package: confluent_kafka
description: confluent-kafka high-performance Apache Kafka Python client
version: "2.11.0"
tag: "2.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - librdkafka
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
export CFLAGS="-I${LIBRDKAFKA_ROOT}/include ${CFLAGS:-}"
export LDFLAGS="-L${LIBRDKAFKA_ROOT}/lib ${LDFLAGS:-}"
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################