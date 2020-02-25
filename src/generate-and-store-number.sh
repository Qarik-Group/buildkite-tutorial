#!/bin/bash

function generate_number() {
  MAX_NUMBER=${MAX_NUMBER:-10}
  echo $(( $RANDOM % $MAX_NUMBER ))
}

buildkite-agent meta-data set generated-number "$(generate_number)"
