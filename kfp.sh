package: kfp
description: Kubeflow Pipelines SDK for ML workflow orchestration
version: "2.13.0"
tag: "2.13.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kfp-2.13.0.tar.gz
requires:
  - Python
  - absl_py
  - click
  - cloudpickle
  - deprecated
  - fire
  - google_auth
  - jsonschema
  - kubernetes
  - protobuf
  - pydantic
  - PyYAML
  - tabulate
  - google_api_python_client
  - uritemplate
  - requests_toolbelt
  - kfp_server_api
  - kfp_pipeline_spec
  - strip_hints
  - typer
  - docstring_parser
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################