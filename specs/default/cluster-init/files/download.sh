#!/bin/bash
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

BASE="$(cd "$(dirname "$0")"; pwd -P)"

export DATAPATH=/mnt/exports/shared/data
export GENOME_FTPBASE=ftp://ftp.ensemblgenomes.org/pub/release-40/plants/fasta/zea_mays/dna
export ACCFILE="$BASE/rnaseq-accessions.txt"

CHR_PREFIX="Zea_mays.AGPv4.dna_sm.chromosome"

qsub="qsub -cwd -V"

function download_genome {
    chroms=$(curl -s -l $GENOME_FTPBASE/ | grep "^${CHR_PREFIX}")
    pushd $DATAPATH
    for chr in $chroms; do
        $qsub -N "download-genome" $BASE/download-genome.sh $chr
    done
    popd
}

function download_rnaseq {
    accs=$(cat $ACCFILE | wc -l)
    pushd $DATAPATH
    $qsub -t 1:$accs -N "download-rnaseq" $BASE/download-rnaseq.sh
    popd
}

download_genome
download_rnaseq