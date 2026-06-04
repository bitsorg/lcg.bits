package: berkeleydb
description: berkeleydb Python bindings for Oracle Berkeley DB
version: "18.1.15"
tag: "18.1.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - libdb
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function MakeInstall() {
  mkdir -p "$INSTALLROOT/lib/python$(python3 -c 'import sys; print("%d.%d"%sys.version_info[:2])')/site-packages"
  # Pass the Berkeley DB C library location and acknowledge AGPL3 license
  BERKELEYDB_DIR="${LIBDB_ROOT}" \
  YES_I_HAVE_THE_RIGHT_TO_USE_THIS_BERKELEY_DB_VERSION=1 \
  python3 -m pip install \
    --no-deps --no-build-isolation --ignore-installed \
    --root=/ --prefix="$INSTALLROOT" .
}
