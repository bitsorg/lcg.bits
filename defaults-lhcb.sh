package: defaults-lhcb
version: v1
disable:
  - Gaudi
  - cepgen
  - hepmcanalysis
  - spark
overrides:
  xgboost:
    tag: 0.90
  lhapdf:
    tag: 6.2.3p1
  photos++:
    tag: 3.56.lhcb1
  pythia6:
    tag: 427.2.lhcb
  # more generators
  #... also a couple of special recipes


---
