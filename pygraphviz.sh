package: pygraphviz
description: PyGraphviz Python interface to Graphviz graph library
version: "1.14"
tag: "1.14"
requires:
  - Python
  - graphviz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function Prepare() {
  # pygraphviz's C extension needs graphviz headers and libs at build time.
  # gcc picks these up automatically via C_INCLUDE_PATH / LIBRARY_PATH.
  export C_INCLUDE_PATH="${GRAPHVIZ_ROOT:+${GRAPHVIZ_ROOT}/include}${C_INCLUDE_PATH:+:${C_INCLUDE_PATH}}"
  export LIBRARY_PATH="${GRAPHVIZ_ROOT:+${GRAPHVIZ_ROOT}/lib}${LIBRARY_PATH:+:${LIBRARY_PATH}}"
  export PKG_CONFIG_PATH="${GRAPHVIZ_ROOT:+${GRAPHVIZ_ROOT}/lib/pkgconfig}${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
}