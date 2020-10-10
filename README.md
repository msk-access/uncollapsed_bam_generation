---
description: >-
  CWL Workflow for producing genomic alignment files (BAM) from
  compressed FASTQ files having unique molecular index
---

# Un-collapsed Binary Alignment Map (BAM) file Generation

[![](https://travis-ci.com/msk-access/standard_bam_processing.svg?branch=feature%2Fstandard_bam_workflow)](https://travis-ci.com/msk-access/standard_bam_processing)

This is the workflow is written using Common Workflow Language \(CWL\) version 1.0 \([https://www.commonwl.org/v1.0/](https://www.commonwl.org/v1.0/)\) and is used at Memorial Sloan Kettering Cancer Center for producing standard bam files from the NY state-approved MSK-ACCESS assay.

It is meant to be run on a single sample paired-end fastq's with unique molecular index(UMI), from Illumina sequencing data, but may be generalizable to other sequencing platforms and sequencing panels as well, which produce paired-end data with UMIs.

### [Documentation](https://msk-access.gitbook.io/uncollapsed-bam-generation/)

![Workflow - Overview](./docs/.gitbook/assets/uncollapsed_bam_generation.png)
