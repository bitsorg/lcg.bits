package: attrs
description: attrs Python classes without boilerplate
version: "25.1.0"
tag: "25.1.0"
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
  # hatch-fancy-pypi-readme is a readme-generation plugin used only when
  # publishing to PyPI — it is not available on the CERN tarball mirror and
  # is not needed for installation.  Remove it from build-system requires so
  # pip (--no-build-isolation) does not try to fetch it from the internet.
  perl -i -pe 's/[,[:space:]]*"hatch-fancy-pypi-readme[^"]*"//g;
          s/"hatch-fancy-pypi-readme[^"]*"[,[:space:]]*//g' pyproject.toml
  mkdir -p "${SITE_PACKAGES}"
  "${PYTHON_EXE}" -m pip install \
    --no-deps --no-build-isolation --ignore-installed \
    --root=/ --prefix="${INSTALLROOT}" .
}