#!/bin/sh
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

chrgz="$@"
curl -s -O "$GENOME_FTPBASE/$chrgz"
