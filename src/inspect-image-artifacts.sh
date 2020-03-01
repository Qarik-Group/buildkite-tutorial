#!/bin/bash

set -eu

mkdir -p tmp/images/
buildkite-agent artifact download "images/*" "tmp/images/"

ls -al tmp/images/
