package: lcg
version: "%(tag_basename)s"
tag: "v1.0"
build_requires:
  - "GCC-Toolchain:(?!osx)"
  - ROOT
---
# This file is included in any build recipe and it's only used to set
# environment variables. Which file to actually include can be defined by the
# "--defaults" option of alibuild.
