package: googledrivedownloader
description: GoogleDriveDownloader download files from Google Drive
version: "0.4"
tag: "0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/googledrivedownloader-0.4.tar.gz
requires:
  - Python
  - setuptools
  - pip
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