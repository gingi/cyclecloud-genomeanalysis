#!/bin/sh
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

index="$1"
fastq="$2"

chr=$(basename $index)

bowtie2 --fast-local \
        -x "$index" -U "$fastq" \
        -S "alignments/$chr-${fastq/\.fastq/}.sam"