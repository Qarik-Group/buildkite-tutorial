#!/bin/bash

(
  set -x

  env | sort

  uname -a
)

if [[ -x "$(command -v node)" ]]; then
  ( set -x; node --version )
else
  echo "WARN: NodeJS not installed"
fi

if [[ -x "$(command -v yarn)" ]]; then
  ( set -x; yarn --version )
else
  echo "WARN: Yarn not installed"
fi
