#!/bin/bash

if [[ "$BUILDKITE_PARALLEL_JOB" == 3 ]]; then
   exit -1
fi

echo "Parallel Job: $BUILDKITE_PARALLEL_JOB"

