package: perf
description: Linux perf performance analysis tool (used from the system on Linux)
version: "system"
license: GPL-2.0-only
# perf is the kernel's own tool, tightly coupled to the running kernel, and can't be
# built here (its compile_perf.sh ships nowhere), so take it from the system. A
# system_requirement gives an upfront, actionable message when absent. Linux-only.
system_requirement_missing: |
  The Linux 'perf' tool was not found on this system.
    * Install it from your distribution, e.g.
        Ubuntu/Debian:  apt install linux-perf
                        (or: linux-tools-common linux-tools-generic linux-tools-$(uname -r))
        RHEL/Alma/Fedora:  dnf install perf
    * Then re-run the build.
system_requirement: "(?!osx)"
system_requirement_check: |
  command -v perf >/dev/null 2>&1 || [ -x /usr/bin/perf ] || [ -x /bin/perf ]
---
