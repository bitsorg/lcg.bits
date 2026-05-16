package: confluent_kafka
description: confluent-kafka high-performance Apache Kafka Python client
version: "2.11.0"
tag: "2.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/confluent_kafka-2.11.0.tar.gz
requires:
  - Python
  - pip
  - librdkafka
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################