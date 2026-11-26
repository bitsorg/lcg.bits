package: fccsw
description: FCCSW Future Circular Collider Software framework
version: "1.0pre12"
tag: "v1.0pre12"
source: https://github.com/HEP-FCC/FCCSW.git
requires:
  - CMake
  - DD4hep
  - k4geo
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
env:
  FCCSW: "$FCCSW_ROOT/share/FCCSW"
prepend_path:
  PYTHONPATH:
    - "$FCCSW_ROOT/python"
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" <<'EoF'
setenv FCCSW $PKG_ROOT/share/FCCSW
if {[file isdirectory $PKG_ROOT/python]} { prepend-path PYTHONPATH $PKG_ROOT/python }
EoF
}
