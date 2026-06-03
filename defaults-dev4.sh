package: defaults-dev4
version: v1
append_arch: dev4

override:
  ROOT:
    tag: 'v6-38-00-patches'

disable:
  - Gaudi
  # k4actstracking is re-enabled: key4hep.sh now pins acts = 44.4.0 and
  # k4actstracking = v00-02 (the LCG_109 heptools-devkey combo), so it builds
  # against the matching ACTS rather than the dev-base acts 26.0.0.
  #
  # (perf is no longer disabled here: it is now a system_requirement -- see
  # perf.sh -- so a missing system perf yields an actionable hint + clean exit
  # rather than a build failure, and adaptyst can use the system perf.)
---

