#!/bin/bash
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

#$ -N download-rnaseq

ACCESSION=$(sed -n -e ${SGE_TASK_ID}p ${ACCFILE})

fasterq-dump $ACCESSION --skip-technical -O $DATAPATH
