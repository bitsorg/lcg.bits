package: cuda
description: NVIDIA CUDA toolkit (used from the system; nvcc must be on PATH)
version: "12.4"
license: LicenseRef-NVIDIA-CUDA
# CUDA is always taken from the system -- bits never builds it. If nvcc is not
# on PATH the build aborts with the message below. The 'cuda' dependency is only
# requested when the active defaults set variable `cuda` truthy (recipes use
# "cuda:(?cuda)", enabled by defaults-cuda), so a stack without the cuda profile
# never triggers this check.
system_requirement_missing: |
  System CUDA toolkit not found: 'nvcc' is not on PATH.
    * Install the NVIDIA CUDA toolkit that provides nvcc, e.g.
        RHEL/Alma:  dnf install cuda-toolkit
        Ubuntu:     apt install nvidia-cuda-toolkit
    * Or build without the 'cuda' defaults profile.
system_requirement: ".*"
system_requirement_check: |
  command -v nvcc >/dev/null 2>&1
---
