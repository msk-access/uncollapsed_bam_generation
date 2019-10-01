---
description: >-
  GATK Best Practices pipeline for producing genomic alignment files from
  compressed Fastq files
---

# Standard Bam Processing

This is the workflow is written using Common Workflow Language \(CWL\) version 1.0 \([https://www.commonwl.org/v1.0/](https://www.commonwl.org/v1.0/)\) and is used at Memorial Sloan Kettering Cancer Center for producing standard bam files from the NY state-approved MSK-ACCESS assay.

It is meant to be run on a single sample paired-end read 1 and read 2 fastq's, from Illumina sequencing data, but may be generalizable to other sequencing platforms and sequencing panels as well, which produce paired-end data.

![Workflow - as viewed from Rabix Composer](https:/raw.github.com/msk-access/standard_bam_processing/develop/.gitbook/assets/standard_bam_processing.cwl.svg?sanitize=true)
<img src="https://raw.github.com/msk-access/standard_bam_processing/develop/.gitbook/assets/standard_bam_processing.cwl.svg?sanitize=true">

