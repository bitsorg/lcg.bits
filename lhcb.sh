package: LHCB
version: "%(tag_basename)s"
tag: "v1.0"
requires:
requires:
  - "GCC-Toolchain:(?!osx)"
  - rangev3
  - boost
  - ROOT
  - GSL
  - fmt
  - HepPDT
  - CLHEP
  - TBB
  - xercesc
  - CppUnit
  - Catch2
  - cppgsl
  - Python-modules-list
  - lcgenv
  - rivet
  - pythia6
#  - GitCondDB
#  - ipyparallel
#  - superchic
#  - xgboost
#  - more packages
  
build_requires:
  - bits-recipe-tools
  - CMake


---
