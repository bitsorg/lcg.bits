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
  # perf cannot build: its recipe calls ./compile_perf.sh, which ships in neither
  # the linux-dev tarball nor the perf patch (the patch only edits setup.py /
  # Makefile.config), and LCG_109 has no perf package at all. adaptyst is perf's
  # only consumer, so disable both. Drop these once perf provides compile_perf.sh.
  - perf
  - adaptyst
---

