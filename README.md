# Buildkite Tutorial

hello This repo contains various Buildkite pipelines for a tutorial (soon to be published) on Stark & Wayne blog.

## Get started
pull request
Click the following button to start [the tutorial](https://github.com/starkandwayne/buildkite-tutorial) on your [free Buildkite account](https://buildkite.com/pricing):

[![Start tutorial on Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

Initially you do not need to fork this repo.

No fields need to be changed at this time. Scroll to the bottom to create the new pipeline.

We can skip the next page "GitHub Webhook Setup" for the moment. Scroll to the bottom and click "Continue to Pipeline".

Now click "New Build" in the top right. Enter an arbitrary message. It can include [Buildkite Emoji](https://github.com/buildkite/emojis), such as "Learning to :pipeline: is fun."

![no-agents](images/buildkite-first-build-no-agents.png)

The pipeline will wait forever until a Buildkite Agent is provided.

We can install and run `buildkite-agent start --spawn 2` to freely host some [Buildkite Agents](buildkite.com/agent) on our local machine:

![buildkite-agent start](images/buildkite-agent-start-local-spawn-2.png)

The Agent will be immediately allocated work to do from our pending pipeline.

Back at the dashboard our pipeline will succeed.

![build-success](images/buildkite-show-environment-success.png)

Expand the `./src/show_environment.sh` step to see its output. What you see here will depend on what machine you are running the Agent.

## Run locally

Each pipeline in `.buildkite` folder can be run locally -- without setting up the Pipeline on buildkite.com -- using the `bk` CLI:

```plain
bk local run .buildkite/pipeline.show-environment.yml
```
