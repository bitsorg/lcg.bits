package: perf
description: Linux perf performance analysis tool (used from the system on Linux)
version: "system"
license: GPL-2.0-only
# perf is taken from the system -- bits never builds it. The previous recipe
# tried to build perf from the linux-dev kernel tree via ./compile_perf.sh, a
# script that ships in neither the tarball nor the perf patch, so the build
# always failed with "./compile_perf.sh: No such file or directory". perf is the
# kernel's own tool and is tightly coupled to the running kernel, so the system
# package is the right source. Declaring it a system_requirement turns the build
# failure into an upfront, actionable message (and a clean exit) when perf is
# absent. Linux-only: there is no perf on macOS.
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
