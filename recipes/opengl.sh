package: opengl
version: "1.0"
# System shim: probes/wraps host-provided components; nothing of the
# wrapped software itself is built or redistributed (2026-07-20 ruling).
license: NOASSERTION
system_requirement_missing: |
  OpenGL development packages are missing on your system.
    * On RHEL-compatible systems you probably need: mesa-libGLU-devel
    * On Ubuntu-compatible systems you probably need: libglu1-mesa-dev
    * On macOS, install XQuartz (provides GL/glu.h under /opt/X11):
        brew install --cask xquartz
      (ROOT itself uses the native Cocoa backend and does not need this.)
system_requirement: ".*"
system_requirement_check: |
  printf "#include <GL/glu.h>\n" | cc -xc - -I/opt/X11/include -c -o /dev/null
---

