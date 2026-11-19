package: catboost
description: CatBoost gradient boosting on decision trees library
version: "1.2.10"
tag: "1.2.10"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake --python"
##############################
# Given LCG's catboost tarball as sources: (LHCb), its C++ model interface
# (headers, libcatboostmodel.so) in LCG's layout instead of the Python wheel.
if [ -f "$SOURCEDIR/include/model_calcer_wrapper.h" ]; then
function MakeInstall() {
  local so
  so=$(ls "$SOURCEDIR"/lib/libcatboostmodel-linux-"$(uname -m)"-*.so 2>/dev/null | head -1)
  [ -n "$so" ] || { echo "catboost: no libcatboostmodel for $(uname -m) in the sources" >&2; return 1; }
  mkdir -p "$INSTALLROOT/catboost/include" "$INSTALLROOT/catboost/lib/model_interface" "$INSTALLROOT/lib"
  cp "$SOURCEDIR"/include/*.h "$INSTALLROOT/catboost/include/"
  cp "$so" "$INSTALLROOT/catboost/lib/model_interface/libcatboostmodel.so"
  ln -sfn ../catboost/lib/model_interface/libcatboostmodel.so "$INSTALLROOT/lib/libcatboostmodel.so"
}
fi
