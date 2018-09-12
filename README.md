# CycleCloud Project for Genome Analysis

![Icon](./icon.png)

This project illustrates how to use a CycleCloud cluster to run a genome analysis. It uses [Bowtie2][] to align experimentally-derived RNA sequences to a reference DNA sequence.

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

* Upload project to locker

  ```shell
  [user@cc cyclecloud-genomeanalysis]$ cyclecloud project upload azure-storage
  ```

* Import template

  ```shell
  [user@cc cyclecloud-genomeanalysis]$ cyclecloud import_template -f template/genomeanalysis.txt
  ```

* Upload [Anaconda Project][]

  ```shell
  [user@cc cyclecloud-genomeanalysis]$ cd ..
  [user@cc projects]$ git clone https://github.com/CycleCloudCommunity/anaconda
  [user@cc projects]$ cd anaconda
  [user@cc anaconda]$ cyclecloud project upload azure-storage
  ```

## Prepare Data

## Links
 [Anaconda Project]: https://github.com/CycleCloudCommunity/anaconda
 [GATK tutorials]: https://software.broadinstitute.org/gatk/documentation/topic?name=tutorials
 [GenomeAnalysis Project]: https://github.com/gingi/cyclecloud-genomeanalysis
 [Maize genome sequence]: ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/lp/LPUQ01.fasta.gz

 [Bowtie2]: http://bowtie-bio.sourceforge.net/bowtie2/index.shtml
 [SRA Toolkit]: https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software

[Full-length cDNA library](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=SRP067440) for [whole-genome sequencing study](https://www.ncbi.nlm.nih.gov/pubmed/28605751).

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
