# CycleCloud Project for Genome Analysis

![Icon](./icon.png)

This project illustrates how to use a CycleCloud cluster to run a genome analysis. It uses [Bowtie2][] to align experimentally-derived RNA sequences to a reference DNA sequence.

In this example, we will align gene transcripts to the maize genome. A [study][] has captured, isolated, and sequenced short fragments that have been transcribed by maize cells. These transcripts are derived from active regions of the genome and may correspond to genes. Aligning the fragments to the genome can therefore be used to find potential genes.

The maize genome, sequenced as part of a publicly funded project, is comprised of 10 chromosomes.<sup>[1](#mito)</sup> This is referred to as the reference sequence. We will fetch the reference sequence as individual chromosomses, and the experimental transcript sequences as batched data sets. We will then align every transcript batch against every chromosome and collate the results.

The project includes scripts that fetch all the source data sets from public repositories directly into a shared file mount, and then spawn an alignment job where each task has as input a query file (a transcript sequences batch) and a target file (a chromosome).

> **Note:** This is an over-simplification of gene-discovery pipelines, which use a combination of previous discoveries in multiple related species, model-based algorithms for predicting genes, and a lot of manual creation by domain experts.

## Prepare Cluster Template

* Install Git

  ```shell
  [user@cc ~]$ sudo yum install git
  ```

* Clone [GenomeAnalysis Project][]

  ```shell
  [user@cc ~]$ mkdir projects
  [user@cc ~]$ cd projects
  [user@cc projects]$ git clone https://github.com/gingi/cyclecloud-genomeanalysis
  [user@cc projects]$ cd cyclecloud-genomeanalysis
  [user@cc cyclecloud-genomeanalysis]$ 
  ```

[@@ NOTE: how to specify locker?]

* Upload project to locker

  ```shell
  [user@cc cyclecloud-genomeanalysis]$ cyclecloud project upload azure-storage
  ```

* Import template

  ```shell
  [user@cc cyclecloud-genomeanalysis]$ cyclecloud import_template -f templates/genomeanalysis.txt
  ```

* Upload [Anaconda Project][]

  ```shell
  [user@cc cyclecloud-genomeanalysis]$ cd ..
  [user@cc projects]$ git clone https://github.com/CycleCloudCommunity/anaconda
  [user@cc projects]$ cd anaconda
  [user@cc anaconda]$ cyclecloud project upload azure-storage
  ```

## Create Cluster

* Use the template

## Fetch Data

* Log into node

  ```shell
  [user@cc ~]$ cyclecloud connect -c genome-cluster master
  Connecting to cyclecloud@10.0.0.10 (instance ID: 56653570276ec3097671e34cd5926ae6) using SSH
  Warning: Permanently added '10.0.0.10' (ECDSA) to the list of known hosts.
  Last login: Wed Oct 10 17:04:34 2018 from 172.30.254.2

   __        __  |    ___       __  |    __         __|
  (___ (__| (___ |_, (__/_     (___ |_, (__) (__(_ (__|
          |

  Cluster: genome-cluster
  Version: 7.6.0
  Run List: recipe[cyclecloud], role[sge_master_role], recipe[anaconda], recipe[cluster_init]
  [cyclecloud@ip-0A00000A ~]$
  ```

* Log in as cluster user

  ```shell
  [cyclecloud@ip-0A00000A ~]$ sudo su - myusername
  [myusername@ip-0A000000A ~]$
  ```

* Run the download workflow

  ```shell
  [myusername@ip-0A000000A ~]$ cd genomeanalysis
  [myusername@ip-0A000000A genomeanalysis]$ ./download.sh
  ```

  This runs a job to download a reference genome 

## Run the alignment workload

```shell
[myusername@ip-0A000000A genomeanalysis]$ ./run-genome-analysis.sh
```


## Links
 [Anaconda Project]: https://github.com/CycleCloudCommunity/anaconda
 [GATK tutorials]: https://software.broadinstitute.org/gatk/documentation/topic?name=tutorials
 [GenomeAnalysis Project]: https://github.com/gingi/cyclecloud-genomeanalysis
 [Maize genome sequence]: ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/lp/LPUQ01.fasta.gz

 [Bowtie2]: http://bowtie-bio.sourceforge.net/bowtie2/index.shtml
 [SRA Toolkit]: https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software
 [cDNA library]: https://www.ncbi.nlm.nih.gov/Traces/study/?acc=SRP067440
 [study]: https://www.ncbi.nlm.nih.gov/pubmed/28605751

 <a name="mito">1</a>: As well as two additional tiny fragments representing sequences derived from the maize mitochondria and plastid, cellular organelles with inactive genomes.


## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
