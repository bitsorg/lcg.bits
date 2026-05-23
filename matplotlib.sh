package: matplotlib
description: Matplotlib comprehensive 2D plotting library for Python
version: "3.10.8"
tag: "3.10.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - numpy
  - nose
  - pyparsing
  - pytz
  - kiwisolver
  - pycairo
  - pillow
  - freetype
  - contourpy
  - fonttools
  - importlib_resources
  - packaging
  - python_dateutil
  - six
  - tornado
  - certifi
  - cycler
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: PSF-2.0
---
#!/bin/bash -e
[ "$(uname -s)" = "Darwin" ] && export SSL_CERT_FILE="${OPENSSL_ROOT}/etc/openssl/cert.pem"
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################