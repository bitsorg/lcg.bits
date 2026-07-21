package: git
description: Git distributed version control system (used from the system; git must be on PATH)
version: "system"
# System shim: probes/wraps host-provided components; nothing of the
# wrapped software itself is built or redistributed (2026-07-20 ruling).
# Git is a prerequisite for bits itself (recipe checkout, source fetches), so
# any host that can run bits already has it — building it from source is
# pointless and only dragged curl/OpenSSL licence baggage into every stack.
# Taken from the system on ALL platforms; the build aborts with the message
# below in the (pathological) case it is missing.
license: NOASSERTION
system_requirement_missing: |
  System git not found: 'git' is not on PATH.
    * git is a prerequisite for bits itself, so it should already be present
      on any build host. Install it with e.g.
        RHEL/Alma:  dnf install git
        Ubuntu:     apt install git
        macOS:      xcode-select --install   (or: brew install git)
system_requirement: ".*"
system_requirement_check: |
  command -v git >/dev/null 2>&1
---
