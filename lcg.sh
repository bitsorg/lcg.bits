package: LCG
version: "%(tag_basename)s"
tag: "v1.0"
requires:
  - ROOT
  - GEANT4
  - DD4Hep
  - JDK
build_requires:
  - bits-recipe-tools
---
##############################
. $(bits-include MetaRecipe)
##############################
