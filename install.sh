#!/usr/bin/env bash
set -e

dcm1="docker-compose"
dcm2="docker compose"
args="--ansi never run --rm testing"

# Setup
$dcm2 down --remove-orphans testing
$dcm2 build testing

# Expected: prompt for 'Program:', accept input, print output.

# Docker Compose v1 and v2 both work fine here.
$dcm1 $args
$dcm2 $args

exec &> >(tee -a "log")

# Docker Compose v1 works fine here ...
$dcm1 $args

# ... but Docker Compose v2 hangs.
echo "Aaaaaaaaaaaaaaand ..."
$dcm2 $args
