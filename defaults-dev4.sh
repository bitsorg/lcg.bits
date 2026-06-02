package: defaults-dev4
version: v1
append_arch: dev4

override:
  ROOT:
    tag: 'v6-38-00-patches'

disable:
  - Gaudi
  # k4actstracking is the only acts consumer; in LCG_109 the key4hep layer
  # (heptools-devkey) builds it against acts 44.4.0, but this stack pins the
  # dev-base value acts 26.0.0. Rather than bump acts (a large jump that would
  # ripple through every ACTS consumer), drop k4actstracking from the build.
  - k4actstracking
---

