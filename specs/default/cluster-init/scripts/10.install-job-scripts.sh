#!/bin/bash
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

set -ex

HOMEDIR=$(jetpack config cuser.home_dir)
SCRIPTS_DIR="${HOMEDIR}/genomeanalysis"

mkdir -p "$SCRIPTS_DIR"
cp -r "$CYCLECLOUD_SPEC_PATH"/files/* "$SCRIPTS_DIR/"
chmod +x "$SCRIPTS_DIR"/*.sh