package: defaults-release
version: v1
env:
  # No CXXFLAGS/-std here: the C++ standard is owned by the compiler-axis defaults
  # (stacks.bits/defaults-gccNN, defaults-clang) per compiler capability, so the
  # shared base never forces a standard on every consumer.
  CFLAGS: "-fPIC -g -O2"
  CMAKE_BUILD_TYPE: "RELWITHDEBINFO"
  MACOSX_DEPLOYMENT_TARGET: '14.0'
---
~    
