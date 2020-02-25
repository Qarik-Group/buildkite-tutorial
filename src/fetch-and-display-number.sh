#!/bin/bash

(
  set -x
  buildkite-agent meta-data get generated-number
)
echo
echo
