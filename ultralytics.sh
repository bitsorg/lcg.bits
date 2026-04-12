package: ultralytics
description: ultralytics Python package
version: "8.3.58"
tag: "8.3.58"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ultralytics-8.3.58.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - wheel
  - numpy
  - matplotlib
  - pillow
  - PyYAML
  - requests
  - scipy
  - torch
  - torchvision
  - tqdm
  - psutil
  - pycpuinfo
  - pandas
  - seaborn
  - ultralytics_thop
  - lap
  - opencv_python
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################