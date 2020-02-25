#!/bin/bash

set -e

generated_number=$(buildkite-agent meta-data get generated-number)

echo "steps:"
for((i=0;i<generated_number;i++));
do
  cat <<YAML
- label: ":hash: $i"
  command: ./src/generate-and-store-number.sh $i
YAML
done
