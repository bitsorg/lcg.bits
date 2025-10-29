package: defaults-dev4
version: v1
env:
  MACOSX_DEPLOYMENT_TARGET: '14.0'

dev3: &base
  - !include dev3.yaml

dev4: &override
  ROOT:
    tag: 'v6-36-00-patches'

overrides:
  [*base, *override]    
---
