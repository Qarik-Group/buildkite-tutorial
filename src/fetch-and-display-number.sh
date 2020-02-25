#!/bin/bash

action=${1:-}

if [[ "$action" == "collect" ]]; then
  parallel_numbers=$(buildkite-agent meta-data get generated-number)
  echo "Fetching $parallel_numbers parallel numbers..."

  for((i=0;i<parallel_numbers;i++)); do
    ( set -x ; buildkite-agent meta-data get "generated-number::$i" )
  done
else
  ( set -x ; buildkite-agent meta-data get generated-number )
fi
echo
echo
