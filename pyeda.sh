package: pyeda
description: PyEDA Boolean algebra and digital logic toolkit
version: "0.29.0"
tag: "0.29.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # setup.py has CRLF line endings in the tarball; strip them first so sed matches.
  sed -i 's/\r//' setup.py
  # Add -Wno-incompatible-pointer-types to suppress C99 → C23 pointer errors in espresso.
  sed -i 's/Extension("pyeda\.boolalg\.espresso", \*\*ESPRESSO),/Extension("pyeda.boolalg.espresso", **ESPRESSO, extra_compile_args=["-Wno-incompatible-pointer-types"]),/' setup.py
}