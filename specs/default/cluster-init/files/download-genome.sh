#!/bin/sh
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

chrgz="$@"
cd $OUTPATH
curl -s -O "$GENOME_FTPBASE/$chrgz"
gunzip "$chrgz"