package: cuda
description: NVIDIA CUDA toolkit (used from the system; nvcc must be on PATH)
version: "12.4"
license: LicenseRef-NVIDIA-CUDA
# CUDA is always taken from the system -- bits never builds it; the build aborts
# below if nvcc is not on PATH. The 'cuda' dependency is only requested under the
# cuda defaults profile, so other stacks never trigger this check.
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
