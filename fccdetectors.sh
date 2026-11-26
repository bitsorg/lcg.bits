package: fccdetectors
description: FCC detector geometry descriptions for simulation
version: "0.1pre11"
tag: "v0.1pre11"
source: https://github.com/HEP-FCC/FCCDetectors.git
requires:
  - CMake
  - DD4hep
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
env:
  FCCDETECTORS: "$FCCDETECTORS_ROOT/share/FCCDetectors"
prepend_path:
  PYTHONPATH:
    - "$FCCDETECTORS_ROOT/python"
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" <<'EoF'
setenv FCCDETECTORS $PKG_ROOT/share/FCCDetectors
if {[file isdirectory $PKG_ROOT/python]} { prepend-path PYTHONPATH $PKG_ROOT/python }
EoF
}
