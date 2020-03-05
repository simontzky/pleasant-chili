#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e60eab2338c8c001bdeb573/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e60eab2338c8c001bdeb573
curl -s -X POST https://api.stackbit.com/project/5e60eab2338c8c001bdeb573/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e60eab2338c8c001bdeb573/webhook/build/publish > /dev/null
