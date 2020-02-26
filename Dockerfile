FROM alpine:latest

ARG agent_version

RUN apk add bash curl jq git

RUN agent_tag=$(curl -sL https://github.com/buildkite/agent/releases/latest -H 'Accept: application/json' | jq -r ".tag_name") && \
    agent_version="${agent_version:-${agent_tag#v}}" && \
    arch=amd64 && \
    agent_url=https://github.com/buildkite/agent/releases/download/v${agent_version}/buildkite-agent-linux-${arch}-${agent_version}.tar.gz && \
    echo "Installing buildkite-agent v${agent_version}..." && \
    curl -L "${agent_url}" | tar -C /usr/bin -xvz ./buildkite-agent
