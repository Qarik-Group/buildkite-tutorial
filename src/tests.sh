#!/bin/bash

if [[ "$BUILDKITE_PARALLEL_JOB" == 3 ]]; then
   exit -1
   
echo "$BUILDKITE_PARALLEL_JOB"

