#!/bin/sh
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

chrgz="$@"
index="$(chr_name $chrgz)"

bowtie2-build "$chrgz" "index/$index" && touch "index/$index.done"