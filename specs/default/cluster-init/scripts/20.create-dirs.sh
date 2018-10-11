#!/bin/bash
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

set -ex

CLUSTERUSER=$(jetpack config cyclecloud.cluster.user.name)
DATAPATH=/mnt/exports/shared/data

mkdir -p "$DATAPATH"
chown $CLUSTERUSER: "$DATAPATH"