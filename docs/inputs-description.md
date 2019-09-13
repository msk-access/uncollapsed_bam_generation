---
description: Here are the various parameters required to run the workflow
---

# Inputs Description

Here is an example json of inputs:

* [Trimgalore](https://github.com/mskcc/cwl-commandlinetools/tree/master/trim_galore_0.6.2)
  * **fastq1:** READ1 of the paired-end run
  * **fastq2:** READ2 of the paired-end run
  * **adapter**: Adapter sequence to be trimmed. If not specified explicitely, the first 13bp of the Illumina adapter 'AGATCGGAAGAGC' will be used by default.
  * **adapter2**: Optional adapter sequence to be trimmed off read 2 of paired-end files. This option requires '--paired' to be specified as well
  * **quality**: Trim low-quality ends from reads in addition to adapter removal. For RRBS samples, quality trimming will be performed first, and adapter trimming is carried in a second round. Other files are quality and adapter trimmed in a single pass. The algorithm is the same as the one used by BWA \(Subtract INT from all qualities; compute partial sums from all indices to the end of the sequence; cut sequence at the index at which the sum is minimal\). Default Phred score: 20.
  * **stringency:** Overlap with adapter sequence required to trim a sequence. Defaults to a very stringent setting of '1', i.e. even a single bp of overlapping sequence will be trimmed of the 3' end of any read.
  * **length:** Discard reads that became shorter than length INT because of either quality or adapter trimming. A value of '0' effectively disables this behaviour. Default: 20 bp.
* [BWA mem](https://github.com/mskcc/cwl-commandlinetools/tree/master/bwa_mem_0.7.12)
* [Picard AddOrReplaceReadGroups](https://github.com/mskcc/cwl-commandlinetools/tree/master/picard_add_or_replace_read_groups_1.96)
* [Picard MarkDuplicates](https://github.com/mskcc/cwl-commandlinetools/tree/master/picard_mark_duplicates_2.8.1)
* Bedtools
  * [GenomeCov](https://github.com/mskcc/cwl-commandlinetools/tree/master/bedtools_genomecov_v2.28.0_cv2)
  * [Merge](https://github.com/mskcc/cwl-commandlinetools/tree/master/bedtools_merge_v2.28.0_cv2)
* [ABRA](https://github.com/mskcc/cwl-commandlinetools/tree/master/abra2_2.17)
* [Picard FixMateInformation](https://github.com/mskcc/cwl-commandlinetools/tree/master/picard_fix_mate_information_1.96)
* GATK
  * [BaseRecalibrator](https://github.com/mskcc/cwl-commandlinetools/tree/master/gatk_BaseRecalibrator_4.1.2.0)
  * [ApplyBQSR](https://github.com/mskcc/cwl-commandlinetools/tree/master/gatk_ApplyBQSR_4.1.2.0)

```text
{
    "M": true,
    "P": true,
    "assume_sorted": true,
    "bam_compression_level": 0,
    "bam_index": true,
    "create_bam_index": true,
    "create_bam_index_1": true,
    "duplicate_scoring_strategy": "SUM_OF_BASE_QUALITIES",
    "fastq1": {
        "class": "File",
        "path": "/ifs/archive/BIC/share/bergerm1/PITT_0236_AHVYTTBBXX/Project_05500_EZ/Sample_TD-seracare-0-5per_IGO_05500_EZ_32/TD-seracare-0-5per_IGO_05500_EZ_32_S25_R1_001.fastq.gz"
    },
    "fastq2": {
        "class": "File",
        "path": "/ifs/archive/BIC/share/bergerm1/PITT_0236_AHVYTTBBXX/Project_05500_EZ/Sample_TD-seracare-0-5per_IGO_05500_EZ_32/TD-seracare-0-5per_IGO_05500_EZ_32_S25_R2_001.fastq.gz"
    },
    "gzip": true,
    "known_sites_1": {
        "class": "File",
        "path": "/ifs/e63data/bergerm1/Resources/DMP/pubdata/dbSNP/VERSIONS/dbsnp_v137/dbsnp_137.b37.vcf"
    },
    "known_sites_2": {
        "class": "File",
        "path": "/ifs/e63data/bergerm1/Resources/DMP/pubdata/mills-and-1000g/VERSIONS/v20131014/Mills_and_1000G_gold_standard.indels.b37.vcf"
    },
    "memory_overhead": null,
    "memory_per_job": null,
    "number_of_threads": null,
    "option_bedgraph": true,
    "paired": true,
    "read_group_identifier": "test",
    "read_group_library": 0,
    "read_group_platform_unit": "test",
    "read_group_sample_name": "test",
    "read_group_sequencing_platform": "test",
    "read_group_sequnecing_center": "test",
    "reference": {
        "class": "File",
        "path": "/ifs/depot/resources/dmp/data/pubdata/hg-fasta/VERSIONS/hg19/Homo_sapiens_assembly19.fasta"
    },
    "sort_order": "coordinate",
    "validation_stringency": "LENIENT"
}
```

{% hint style="info" %}
Note that the paths in the inputs file are relative to the file itself. It is normally easier to use absolute paths whenever possible.
{% endhint %}

