package: defaults-lhcb
version: v1
#disable:
# - Gaudi
# - cepgen
# - hepmcanalysis
# - spark
overrides:
#  xgboost:
#    tag: 0.90
  lhapdf:
    # tag: 6.2.3p1
    tag: v6.5.2
    source: https://github.com/alisw/LHAPDF
  photos:
    #tag: 3.56.lhcb1
    tag: "v3.64"
    source: https://github.com/alisw/photospp.git
  pythia6:
    # tag: 427.2.lhcb
    tag: "428-alice2"
    source: https://github.com/alisw/pythia6.git

# more generators
#... also a couple of special recipes


---
