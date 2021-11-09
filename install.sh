#!/usr/bin/env bash
set -e
docker compose down --remove-orphans testing
docker compose build testing
#exec &> >(tee -a "foo.log")
docker compose --ansi never run --rm testing
