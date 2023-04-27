#!/bin/bash

set -eu

# Generate YAML file
cat << EOF > configs.yaml
steps:
  - trigger: testtrigger
EOF

buildkite-agent pipeline upload configs.yaml
