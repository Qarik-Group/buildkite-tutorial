#!/bin/bash

set -e

: ${STEPS_COUNT:?please configure pipeline with \$STEPS_COUNT environment variable}

buildkite-agent meta-data set steps-count "$STEPS_COUNT"

echo "steps:"
for((i=0;i<STEPS_COUNT;i++));
do
  cat <<YAML
- label: "$i"
  command: ./src/generate-and-store-number.sh $i
YAML
done
