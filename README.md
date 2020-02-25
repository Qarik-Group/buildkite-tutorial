# Buildkite Tutorial

This repo contains various Buildkite pipelines for a tutorial (soon to be published) on Stark & Wayne blog.

Click the following button to start the tutorial on your [free Buildkite account](https://buildkite.com/pricing):

[![Start tutorial on Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

## Run locally

Each pipeline in `.buildkite` folder can be run locally -- without setting up the Pipeline on buildkite.com -- using the `bk` CLI:

```plain
bk local run .buildkite/pipeline.show-environment.yml
```
