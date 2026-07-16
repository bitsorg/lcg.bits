package: attrs
description: attrs Python classes without boilerplate
version: "25.1.0"
source: https://github.com/python-attrs/attrs
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - hatchling
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function MakeInstall() {
  # hatch-fancy-pypi-readme is a PyPI-publish-only plugin, absent from the CERN
  # mirror. Drop it from build-system requires so pip (--no-build-isolation)
  # does not try to fetch it from the internet.
  perl -i -pe 's/[,[:space:]]*"hatch-fancy-pypi-readme[^"]*"//g;
          s/"hatch-fancy-pypi-readme[^"]*"[,[:space:]]*//g' pyproject.toml
  mkdir -p "${SITE_PACKAGES}"
  "${PYTHON_EXE}" -m pip install \
    --no-deps --no-build-isolation --ignore-installed \
    --root=/ --prefix="${INSTALLROOT}" .
}