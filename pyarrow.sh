package: pyarrow
description: PyArrow Python bindings to Apache Arrow
version: 24.0.0
tag: 24.0.0
requires:
  - Python
  - numpy
  - six
  - cython
  - arrow
  - pkg_config
  - setuptools_scm
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
export PYARROW_WITH_PARQUET=1
export PYARROW_WITH_DATASET=1
export ARROW_HOME="${ARROW_ROOT}"
export LD_LIBRARY_PATH="${ARROW_ROOT}/lib:${LD_LIBRARY_PATH:-}"
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
