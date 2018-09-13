#!/bin/bash
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

BASE="$(cd "$(dirname "$0")"; pwd -P)"
export DATAPATH=/mnt/exports/shared/data

qsub="qsub -cwd -V"

function list_reads {
    ls *.fastq
}

function list_genome {
    ls *.fa.gz
}

function chr_name {
    echo ${1/\.fa\.gz/}
}
export -f chr_name

cd $DATAPATH

mkdir -p index
mkdir -p logs
mkdir -p alignments

# Build genome index
list_genome | while read chrgz; do
    chr="$(chr_name $chrgz)"
    chrindex="index/$chr.done"
    if [ ! -e "$chrindex" ]; then
        $qsub -N "index-$chr" "$BASE/build-index.sh" $chrgz
    else
        echo "Index $chrindex already exists"
    fi
done

# Map reads
list_genome | while read chrgz; do
    chr="$(chr_name $chrgz)"
    chrindex="index/$chr"
    list_reads | while read readsfile; do
        # -l h_rt: Prevent jobs from running >2h
        $qsub -hold_jid "index-$chr" \
              -N "align-$chr-${readsfile/\.fastq/}" \
              -l h_rt=02:00:00 \
              "$BASE/align-reads.sh" "$chrindex" "$readsfile"
    done
done