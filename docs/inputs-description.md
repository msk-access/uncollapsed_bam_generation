---
description: Various parameters required to run the workflow
---

# Inputs Description

{% hint style="warning" %}
Common workflow language execution engines accept two types of input that are [JSON](https://json.org) or [YAML](https://yaml.org), please make sure to use one of these while generating the input file. For more information refer to: [http://www.commonwl.org/user\_guide/yaml/](http://www.commonwl.org/user_guide/yaml/)
{% endhint %}

* [Trimgalore](https://github.com/mskcc/cwl-commandlinetools/tree/master/trim_galore_0.6.2)
  * **fastq1:** Read 1 of the paired-end run
  * **fastq2:** Read 2 of the paired-end run
  * **adapter**: Adapter sequence to be trimmed. If not specified explicitly, the first 13bp of the Illumina adapter 'AGATCGGAAGAGC' will be used by default.
  * **adapter2**: Optional adapter sequence to be trimmed off read 2 of paired-end files. This option requires '--paired' to be specified as well
  * **quality**: Trim low-quality ends from reads in addition to adapter removal. For RRBS samples, quality trimming will be performed first, and adapter trimming is carried in a second round. Other files are quality and adapter trimmed in a single pass. The algorithm is the same as the one used by BWA \(Subtract INT from all qualities; compute partial sums from all indices to the end of the sequence; cut sequence at the index at which the sum is minimal\). Default Phred score: 20.
  * **stringency:** Overlap with adapter sequence required to trim a sequence. Defaults to a very stringent setting of '1', i.e. even a single bp of overlapping sequence will be trimmed of the 3' end of any read.
  * **length:** Discard reads that became shorter than length INT because of either quality or adapter trimming. A value of '0' effectively disables this behaviour. Default: 20 bp.
* Alignment with [BWA mem](https://github.com/mskcc/cwl-commandlinetools/tree/master/bwa_mem_0.7.12) and [Picard AddOrReplaceReadGroups](https://github.com/mskcc/cwl-commandlinetools/tree/master/picard_add_or_replace_read_groups_1.96)
  * **P:** skip pairing; mate rescue performed unless -S also in use
  * **M:** mark shorter split hits as secondary \(for Picard/GATK compatibility\)
  * **reference:** Reference fasta file
  * **read\_group\_identifier:** Read Group ID  Default value: 1. This option can be set to 'null' to clear the default value  Required
  * **read\_group\_sequencing\_center:** Read Group sequencing center name  Default value: null. Required.
  * **read\_group\_library:** Read Group Library.  Required
  * **read\_group\_platform\_unit**: Read Group platform unit \(eg. run barcode\)  Required.
  * **read\_group\_sample\_name**: Read Group sample name.  Required
  * **read\_group\_sequencing\_platform:** Read Group platform \(e.g. illumina, solid\)  Required.
* [Picard MarkDuplicates](https://github.com/mskcc/cwl-commandlinetools/tree/master/picard_mark_duplicates_2.8.1)
  * No parameters are exposed for this step
* Indel Realignment with Bedtools [GenomeCov](https://github.com/mskcc/cwl-commandlinetools/tree/master/bedtools_genomecov_v2.28.0_cv2), [Merge](https://github.com/mskcc/cwl-commandlinetools/tree/master/bedtools_merge_v2.28.0_cv2), [ABRA](https://github.com/mskcc/cwl-commandlinetools/tree/master/abra2_2.17), and [Picard FixMateInformation](https://github.com/mskcc/cwl-commandlinetools/tree/master/picard_fix_mate_information_1.96)
  * **maximum\_average\_depth:** Regions with average depth exceeding this value will be downsampled \(default: 1000\)
  * **soft\_clip\_contig:** Soft clip contig args \[max\_contigs,min\_base\_qual,frac\_high\_qual\_bases,min\_soft\_clip\_len \(default:16,13,80,15\)
  * **maximum\_mixmatch\_rate:** Max allowed mismatch rate when mapping reads back to contigs \(default:

    0.05\)

  * **scoring\_gap\_alignments:** Scoring used for contig alignments\(match,mismatch\_penalty,gap\_open\_penalty,gap\_extend\_penalty \(default:8,32,48,1\)
  * **contig\_anchor:** Contig anchor \[M\_bases\_at\_contig\_edge,max\_mismatches\_near\_edge\] \(default:10,2\)
  * **window\_size:** Processing window size and overlap \(size,overlap\) \(default: 400,200\)
  * **consensus\_sequence:** Use positional consensus sequence when aligning high quality soft clipping
  * **output\_file\_name:** Required list of output sam or bam file \(s\) separated by comma
  * **ignore\_bad\_assembly:** Use this option to avoid parsing errors for corrupted assemblies
  * **bam\_index:** Enable BAM index generation when outputting sorted alignments \(may require additional memory\)
  * **no\_sort:** Do not attempt to sort final output
* Base Quality Score Recalibration using GATK [BaseRecalibrator](https://github.com/mskcc/cwl-commandlinetools/tree/master/gatk_BaseRecalibrator_4.1.2.0) & [ApplyBQSR](https://github.com/mskcc/cwl-commandlinetools/tree/master/gatk_ApplyBQSR_4.1.2.0)
  * **known\_sites\_1 & known\_sites\_2:** One or more databases of known polymorphic sites used to exclude regions around known polymorphisms from analysis
  * **read\_filter:** Read filters to be applied before analysis

## Example inputs file:

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

