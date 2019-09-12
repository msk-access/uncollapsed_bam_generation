# ACCESS standard bam processing

[![](https://travis-ci.com/msk-access/standard_bam_processing.svg?branch=feature%2Fstandard_bam_workflow)](https://travis-ci.com/msk-access/standard_bam_processing)

### [Documentation](https://msk-access.gitbook.io/standard-bam-processing/)

---

#### Workflow for generating MSK-ACCESS standard binary alignment mapping files

This workflow will produce bam files that adhere to the [GATK best practices](https://software.broadinstitute.org/gatk/best-practices/workflow?id=11165)

It consists of the following steps:

1. Adapter trimming with [Trimgalore](https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/)
2. Read mapping to a reference genome with [BWA mem](http://bio-bwa.sourceforge.net/)
3. Conversion of SAM to BAM file with [Picard AddOrReplaceReadGroups](https://broadinstitute.github.io/picard/command-line-overview.html#AddOrReplaceReadGroups)
4. Duplicates Marking with [Picard MarkDuplicates](https://broadinstitute.github.io/picard/command-line-overview.html#MarkDuplicates)
5. Indel Realignment with [ABRA2](https://github.com/mozack/abra2)
6. Fixing Mate Information with [Picard FixMateInformation](https://broadinstitute.github.io/picard/command-line-overview.html#FixMateInformation)
7. Base Quality Score Recalibration with [GATK BaseRecalibrator / PrintReads](https://software.broadinstitute.org/gatk/documentation/article?id=11081)
