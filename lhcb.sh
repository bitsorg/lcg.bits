package: LHCB
version: "%(tag_basename)s"
tag: "v1.0"
requires:
  # - LCG # lhcb does not want all the packages from the LCG build
  - DD4hep
  - lcgenv
  - GitCondDB
  - ipyparallel
  - superchic
  - rivet
  - xgboost
  - pythia6
  # - more packages

---
