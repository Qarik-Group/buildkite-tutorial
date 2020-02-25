#!/bin/bash

function generate_number() {
  MAX_NUMBER=${MAX_NUMBER:-9}
  echo $(( $RANDOM % $MAX_NUMBER + 1))
}

parallel_index=${1:-}

generated_number=$(generate_number)

if [[ -n "$parallel_index" ]]; then
  ( set -x ; buildkite-agent meta-data set "generated-number::$parallel_index" "${generated_number}" )
  echo
else
  ( set -x ; buildkite-agent meta-data set "generated-number" "${generated_number}" )
fi

echo
