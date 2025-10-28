package: defaults-dev3
version: v1
<<<<<<< HEAD
disable:
  - MySQL
overrides:
  ROOT:
    tag: 'master'
  hepmc3:
    tag: 'master'
  DD4Hep:
    tag: 'master'
  Gaudi:
    tag: 'master'
---
=======
env:
  MACOSX_DEPLOYMENT_TARGET: '14.0'

overrides: !include dev3.yaml

 ---
>>>>>>> e74fa35 (Using include tag to share overrides between defaults)
