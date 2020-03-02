#!/bin/bash

set -eu

: "${BUILDKITE_API_TOKEN_CREATE_PIPELINES:?required API token with write_pipelines} scope}"
: "${BUILDKITE_API_TOKEN_CREATE_BUILDS:?required API token with write_builds} scope}"

# allow specification of org when using `bk local run`
BUILDKITE_ORG_SLUG=${BUILDKITE_ORG_SLUG:-$BUILDKITE_ORGANIZATION_SLUG}
BUILDKITE_REPO_X=${BUILDKITE_REPO_X:-$BUILDKITE_REPO}

steps_count=$(buildkite-agent meta-data get "steps-count")
pipeline_name=$(buildkite-agent meta-data get "pipeline-name")

: "${steps_count:?required}"
: "${pipeline_name:?required}"

env | sort

new_pipeline_json=$(jq -r \
  --arg name "$pipeline_name" \
  --arg steps_count "$steps_count" \
  --arg repo "$BUILDKITE_REPO_X" \
  '{"name": $name, "repository": $repo, "env": {"STEPS_COUNT": $steps_count}, "steps": [{"type": "script", "label": ":pipeline:", "command": "buildkite-agent pipeline upload .buildkite/pipeline.dynamic-steps-from-env-var.yml"}]}' <<< '{}')

echo curl \
  https://api.buildkite.com/v2/organizations/${BUILDKITE_ORG_SLUG}/pipelines \
  -X POST \
  -d "$new_pipeline_json"
create_pipeline_response=$(curl -fsS -H "Authorization: Bearer ${BUILDKITE_API_TOKEN_CREATE_PIPELINES}" \
  https://api.buildkite.com/v2/organizations/${BUILDKITE_ORG_SLUG}/pipelines \
  -X POST \
  -d "$new_pipeline_json")
builds_url=$(jq -r ".builds_url" <<< "$create_pipeline_response")
echo "Pipeline Builds URL: $builds_url"

curl -fsS -H "Authorization: Bearer ${BUILDKITE_API_TOKEN_CREATE_BUILDS}" \
  "${builds_url}" \
  -X "POST" \
  -F "commit=HEAD" \
  -F "branch=master" \
  -F "message=First build comes free :rocket:"
