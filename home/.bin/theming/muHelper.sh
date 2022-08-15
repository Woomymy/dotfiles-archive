#!/usr/bin/env bash

set -euo pipefail

jq -r ".${1}" "/tmp/mu_palette.json"

