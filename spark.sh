package: spark
description: Apache Spark unified analytics engine for large-scale data
version: "4.1.1"
tag: "4.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/spark-4.1.1-bin-hadoop3.tgz
requires:
  - hadoop
  - Python
  - py4j
  - grpcio
  - numpy
  - pandas
  - PyYAML
  - pyarrow
  - zstandard
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
# Spark ships as a prebuilt binary distribution, not a pip package, so install
# the unpacked tree verbatim with BinaryRecipe (PythonRecipe's `pip install .`
# fails: no top-level setup.py/pyproject.toml; pyspark lives under python/).
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function PostInstall() {
  # Expose the Spark home, its sbin scripts, and the bundled pyspark sources.
  # py4j comes from its own package (a runtime dependency) via PYTHONPATH.
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv SPARK_HOME $PKG_ROOT
prepend-path PATH $PKG_ROOT/sbin
prepend-path PYTHONPATH $PKG_ROOT/python
EOF
}