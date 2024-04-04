# Molecular-epi-ncov
This repository is used to provide a molecular epidemiology analysis of SARS-CoV-2 data from GISAID.


## Table of contents

* [Installation](#Installation)
* [Repo contents](#Repo-contents)
* [Usage](#Usage)
* [License](#License)

## Installation

### Hardware requirements
The molecular-epi-ncov package requires a standard server or computer with enough RAM to provide support for operations performed in memory.

### OS Requirements

All code is tested on Linux: Ubuntu 20.04.1 and MacOSX operating systems.

The R script is compatible with Windows, Mac, and Linux operating systems.

### Software Requirements

You will require the following software installed on your server or computer before starting:

* [Python](https://www.python.org/)(>=3.9)
* [Jupyter Notebook](https://jupyter.org/)
* [Treetime](https://github.com/neherlab/treetime)
* [Nextclade](https://nextstrain.org/)
* [Augur](https://docs.nextstrain.org/projects/augur/en/stable/index.html)
* [Seqkit](https://bioinf.shenwei.me/seqkit/)
* [R](https://cloud.r-project.org/)(>=4.2)

### Package dependencies

From a terminal, use `pip` to install the following Python dependencies before running the script:

```sh
pip install pandas seaborn matplotlib
```

From an R session, type:

```R
install.packages("reshape2", "ggplot2", "htmlwidgets", "webshot")
devtools::install_github("hrbrmstr/streamgraph")
```

## Repo contents
* [clade-distribution](./clade-distribution): `R` package code.
* [ancestral_sequence](./ancestral_sequence): Mutation table of ancestral sequences reconstructed by treetime.
* [exampledata](./exampledata): Example data randomly extracted from the Gisaid database and China: Guangdong sequences.


## Usage

### 1. Obtain SARS-CoV-2 sequences from public databases

To obtain the most recent GISAID SARS-CoV-2 data in a single file, you can use the batch download feature on the GISAID website（https://gisaid.org/）. The files you need are metadata_tsv_2024_01_27.tar.xz and sequences_fasta_2024_01_27.tar.xz. Please note that membership is required to access this feature.

### 2. Select sequences that meet the specified criteria.

You can download the SARS-CoV-2 reference dataset, to run :
```sh
nextclade dataset get \
  --name 'nextstrain/sars-cov-2/wuhan-hu-1' \
  --tag '2024-01-28T00:00:00Z' \
  --output-dir '~/sars-cov-2-2024-01-28update'
```
To filter sequences that meet the criteria `suspiciously clustered single-nucleotide polymorphisms (SNPs) [quality control (QC) SNP clusters status metric not “good”; ≥ 6 mutations in 100 bases], too many private mutations (QC private mutations status metric not good; ≥ 10 mutations from the nearest tree node), or overall bad quality (Nextclade QC overall status “bad”)`, run seq_filter.ipynb(global sequences) or gd_seq.ipynb(China: Guangdong sequences) in Jupyter Notebook or VS Code.

### 3. Obtain genotype and clade distribution plot.

Run `clade_distribution.ipynb` to obtain `weekly_clade_distribution.csv`, then run `clade-distribution/scripts/clade.R` to obtain genotype distribution plots.

### 4. Get mutation heatmaps of the SARS-CoV-2 genome.

> [!NOTE]
> Before starting, run ancestral_sequence.sh to get ancestral sequence.

To get the mutation heatmap of SARS-CoV-2, run mutation_heatmap.ipynb. Ancestral sequences were reconstructed using TreeTime. Taking ba.5.2.48 as an example, run the script `sh ancestral_sequence.sh` to retrieve its ancestral node. The command `treetime ancestral` is computationally intensive and requires a significant amount of memory.

## License
This project is covered under **MIT License**.
