package: defaults-dev4
version: v1
<<<<<<< HEAD
overrides:
  ROOT:
    tag: '6.36-patches'
=======
env:
  MACOSX_DEPLOYMENT_TARGET: '14.0'

dev3: &base
  - !include dev3.yaml

dev4: &ext
  ROOT:
    tag: 'v6-36-00-patches'

overrides:
  [*base, *ext]    
>>>>>>> e74fa35 (Using include tag to share overrides between defaults)
---
