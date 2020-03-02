#!/bin/bash

set -eux

: "${GITHUB_REPO:?required}"
GITHUB_REPO="${GITHUB_REPO#https://}"
metadata_key_github_repo_version="${GITHUB_REPO}::latest-version"

latest_release_json="$(curl -sSL "https://$GITHUB_REPO/releases/latest" -H 'Accept: application/json')"
latest_release_tag=$(echo "$latest_release_json" | jq -r ".tag_name")
latest_release_version="${latest_release_tag#v}"
latest_release_version="${latest_release_version#go}"
echo "$latest_release_version"

[[ $(buildkite-agent meta-data exists "$metadata_key_github_repo_version") ]] && {
  previous_release_version="$(buildkite-agent meta-data get "$metadata_key_github_repo_version")"
  echo "$previous_release_version"
}

exit 0