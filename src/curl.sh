#!/bin/bash

set -eu

# Generate YAML file
cat << EOF > config.yaml
steps:
  - trigger: testtrigger
EOF
