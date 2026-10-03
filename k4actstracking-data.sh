package: k4actstracking-data
description: k4ActsTracking geometry and material data (MuColl, MuSIC, MAIA)
# Upstream data/CMakeLists.txt fetches these with wget at configure time and
# ignores failures; the minimal build images have no wget. Fetched here as
# sources: instead. md5s from upstream data/file_list.txt (v00-02 and main).
version: "1"
sources:
  - https://key4hep.web.cern.ch/key4hep/k4ActsTracking/MuColl/data/MAIA_v0.json,md5:06d4ae408e7890d2549e9015476d5a53
  - https://key4hep.web.cern.ch/key4hep/k4ActsTracking/MuColl/data/MAIA_v0_material.json,md5:2152eff18592c58a53b0b5965abfa5d0
  - https://key4hep.web.cern.ch/key4hep/k4ActsTracking/MuColl/data/MAIA_v0_gen3_material_map.json,md5:60d2c30473f482eb511f6bd1f77872aa
  - https://key4hep.web.cern.ch/key4hep/k4ActsTracking/MuColl/data/material-maps.json,md5:ac0124bb6c0129179183cb34a631f74e
  - https://key4hep.web.cern.ch/key4hep/k4ActsTracking/MuColl/data/MuColl_v1.json,md5:06d4ae408e7890d2549e9015476d5a53
  - https://key4hep.web.cern.ch/key4hep/k4ActsTracking/MuColl/data/MuSIC_v1.json,md5:9f0479cbd606bfefcac4297e3e44c786
  - https://key4hep.web.cern.ch/key4hep/k4ActsTracking/MuColl/data/MuSIC_v2.json,md5:9f0479cbd606bfefcac4297e3e44c786
  - https://key4hep.web.cern.ch/key4hep/k4ActsTracking/MuColl/data/MAIA_v0.root,md5:3a6b63c917c3777a30fc577e58dc4ad5
  - https://key4hep.web.cern.ch/key4hep/k4ActsTracking/MuColl/data/MuColl_v1.root,md5:ecec81e34a3a433e8034ff1d1865b151
  - https://key4hep.web.cern.ch/key4hep/k4ActsTracking/MuColl/data/MuSIC_v1.root,md5:d20172c3e3561774c012f0ff3bad5ea9
  - https://key4hep.web.cern.ch/key4hep/k4ActsTracking/MuColl/data/MuSIC_v2.root,md5:0d0413d152f404d30b4f558328d22d41
enforce_checksums: true
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
dest="$INSTALLROOT/share/k4ActsTracking/data"
mkdir -p "$dest"
for ((i = 0; i < SOURCE_COUNT; i++)); do
  s="SOURCE$i"
  cp "$SOURCEDIR/${!s}" "$dest/"
done
