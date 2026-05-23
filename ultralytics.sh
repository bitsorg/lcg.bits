package: ultralytics
description: Ultralytics YOLO object detection and tracking framework
version: "8.3.58"
tag: "8.3.58"
requires:
  - Python
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
  - "GCC-Toolchain:(?!osx)"
license: AGPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################