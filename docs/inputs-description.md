---
description: Various parameters required to run the workflow
---

# Inputs Description

{% hint style="warning" %}
Common workflow language execution engines accept two types of input that are [JSON](https://json.org) or [YAML](https://yaml.org), please make sure to use one of these while generating the input file. For more information refer to: [http://www.commonwl.org/user\_guide/yaml/](http://www.commonwl.org/user_guide/yaml/)
{% endhint %}

## **Parameter Used by Tools**

### Common Parameters Across Tools

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :--- | :---: |


### Fgbio [FastqToBam](https://github.com/msk-access/cwl-commandlinetools/tree/develop/fgbio_fastq_to_bam_1.2.0)

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :--- | :---: |


### Picard [MergeSamFiles](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_merge_sam_files_4.1.8.0)

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :--- | :---: |


### Picard [SamToFastq](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_sam_to_fastq_4.1.8.0)

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :--- | :---: |
| **gatk\_sam\_to\_fastq\_output\_name\_unpaired** | unpaired fastq output file name |  |
| **gatk\_sam\_to\_fastq\_output\_name\_R1** | Read1 fastq.gz output file name |  |
| **gatk\_sam\_to\_fastq\_output\_name\_R2** | Read2 fastq.gz output file name |  |
| **gatk\_sam\_to\_fastq\_include\_non\_primary\_alignments** | If true, include non-primary alignments in the output. Support of non-primary alignments in SamToFastq is not comprehensive, so there may be exceptions if this is set to true and there are paired reads with non-primary alignments. |  |
| **gatk\_sam\_to\_fastq\_include\_non\_pf\_reads** | Include non-PF reads from the SAM file into the output FASTQ files. PF means 'passes filtering'. Reads whose 'not passing quality controls' flag is set are non-PF reads. See GATK Dictionary for more info. |  |

### [Fastp](https://github.com/msk-access/cwl-commandlinetools/tree/develop/fastp_0.20.1)

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :--- | :---: |
| **fastq1** | Read 1 of the paired-end run |  |
| **fastq2** | Read 2 of the paired-end run |  |
| **adapter** | Adapter sequence to be trimmed. | GATCGGAAGAGC |
| **adapter2** | Optional adapter sequence to be trimmed off read 2 of paired-end files. This option requires '--paired' to be specified as well | AGATCGGAAGAGC |
| **quality** | Trim low-quality ends from reads in addition to adapter removal. For RRBS samples, quality trimming will be performed first, and adapter trimming is carried in a second round. Other files are quality and adapter trimmed in a single pass. The algorithm is the same as the one used by BWA \(Subtract INT from all qualities; compute partial sums from all indices to the end of the sequence; cut sequence at the index at which the sum is minimal\). | 1 |
| **stringency** | Overlap with adapter sequence required to trim a sequence. Defaults to a very stringent setting of '1', i.e. even a single bp of overlapping sequence will be trimmed of the 3' end of any read. | 3 |
| **length** | Discard reads that became shorter than length INT because of either quality or adapter trimming. A value of '0' effectively disables this behaviour. | 25 |

### [BWA MEM](https://github.com/msk-access/cwl-commandlinetools/tree/develop/bwa_mem_0.7.17)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **bwa\_mem\_Y** | Force soft-clipping rather than default hard-clipping of supplementary alignments |  |
| **bwa\_mem\_T** | Don’t output alignment with score lower than INT. This option only affects output. |  |
| **bwa\_mem\_P** | In the paired-end mode, perform SW to rescue missing hits only but do not try to find hits that fit a proper pair. |  |
| **bwa\_mem\_output** | Output SAM file name |  |
| **bwa\_mem\_M** | Mark shorter split hits as secondary |  |
| **bwa\_mem\_K** | to achieve deterministic alignment results \(Note: this is a hidden option\) |  |
| **bwa\_number\_of\_threads** | Number of threads |  |

### Picard [AddOrReplaceReadGroups](https://github.com/msk-access/cwl-commandlinetools/tree/develop/picard_add_or_replace_read_groups_4.1.8.1)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **picard\_addRG\_read\_group\_sequencing\_platform** | Read-Group platform \(e.g. ILLUMINA, SOLID\) |  |
| **picard\_addRG\_read\_group\_sequencing\_center** | Read-Group sequencing center name |  |
| **picard\_addRG\_read\_group\_run\_date** | Read-Group date in \(Iso8601Date\) |  |
| **picard\_addRG\_read\_group\_platform\_unit** | Read-Group Platform Unit \(eg. run barcode\) |  |
| **picard\_addRG\_read\_group\_library** | Read-Group library |  |
| **picard\_addRG\_read\_group\_identifier** | Read-Group ID |  |
| **picard\_addRG\_read\_group\_description** | Read-Group Description |  |
| **picard\_addRG\_output\_file\_name** | Output BAM file name |  |
| **picard\_addRG\_read\_group\_sample\_name** | Read-Group sample name |  |

### GATK [MergeBamAlignment](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_merge_bam_alignment_4.1.8.0)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **gatk\_merge\_bam\_alignment\_output\_file\_name** | Output BAM file name |  |

### Picard [MarkDuplicates](https://github.com/msk-access/cwl-commandlinetools/tree/develop/picard_mark_duplicates_4.1.8.1)

* No parameters are exposed for this step

### bedtools [genomecov](https://github.com/msk-access/cwl-commandlinetools/tree/develop/bedtools_genomecov_v2.28.0_cv2)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **bedtools\_genomecov\_option\_bedgraph** | option flag parameter to choose output file format. -bg refers to bedgraph format |  |

### bedtools [merge](https://github.com/msk-access/cwl-commandlinetools/tree/develop/bedtools_merge_v2.28.0_cv2)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **bedtools\_merge\_distance\_between\_features** | Maximum distance between features allowed for features to be merged. |  |

### [ABRA2](https://github.com/msk-access/cwl-commandlinetools/tree/develop/abra2_2.22)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **abra2\_window\_size** | Processing window size and overlap \(size,overlap\) \(default: 400,200\) |  |
| **abra2\_soft\_clip\_contig** | Soft clip contig args \[max_contigs,min\_base\_qual,frac_ high\_qual\_bases,min\_soft\_clip\_len\] \(default:16,13,80,15\) |  |
| **abra2\_scoring\_gap\_alignments** | Scoring used for contig alignments\(match, mismatch\_penalty,gap\_open\_penalty,gap\_extend\_penalty\) \(default:8,32,48,1\) |  |
| **abra2\_no\_sort** | Do not attempt to sort final output |  |
| **abra2\_no\_edge\_complex\_indel** | Prevent output of complex indels at read start or read end |  |
| **abra2\_maximum\_mixmatch\_rate** | Max allowed mismatch rate when mapping reads back to contigs \(default: 0.05\) |  |
| **abra2\_maximum\_average\_depth** | Regions with average depth exceeding this value will be downsampled \(default: 1000\) |  |
| **abra2\_contig\_anchor** | Contig anchor \[M\_bases\_at\_contig\_edge,max\_mismatches\_near\_edge\] \(default:10,2\) |  |
| **abra2\_consensus\_sequence** | Use positional consensus sequence when aligning high quality soft clipping |  |

### Picard [FixMateInformation](https://github.com/msk-access/cwl-commandlinetools/tree/develop/picard_fix_mate_information_4.1.8.1)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **picard\_fixmate\_information\_output\_file\_name** | The output BAM file to write to |  |

### GATK [BaseRecalibrator](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_base_recalibrator_4.1.8.1)

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :--- | :---: |
| **known\_sites\_1 & known\_sites\_2** | One or more databases of known polymorphic sites used to exclude regions around known polymorphisms from analysis |  |
| **read\_filter** | Read filters to be applied before analysis | GoodCigarReadFilter |

### GATK [ApplyBQSR](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_apply_bqsr_4.1.8.1)

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :--- | :---: |
| **known\_sites\_1 & known\_sites\_2** | One or more databases of known polymorphic sites used to exclude regions around known polymorphisms from analysis |  |
| **read\_filter** | Read filters to be applied before analysis | GoodCigarReadFilter |

## Template inputs file:

{% hint style="warning" %}
**Parameters not marked as optional are required**
{% endhint %}

{% code title="template-inputs.json" %}
```javascript
{
    "R1_output_fastq": "processed_fastq_R1.fastq.gz",
    "R2_output_fastq": "processed_fastq_R2.fastq.gz",
    "abra2_bam_index": true,
    "abra2_consensus_sequence": null,
    "abra2_contig_anchor": null,
    "abra2_maximum_average_depth": null,
    "abra2_maximum_mixmatch_rate": null,
    "abra2_no_edge_complex_indel": true,
    "abra2_no_sort": null,
    "abra2_output_bams": "test_abra.bam",
    "abra2_scoring_gap_alignments": null,
    "abra2_soft_clip_contig": null,
    "abra2_window_size": null,
    "apply_bqsr_output_file_name": null,
    "base_recalibrator_output_file_name": null,
    "bedtools_genomecov_option_bedgraph": true,
    "bedtools_merge_distance_between_features": null,
    "bwa_mem_K": 1000000,
    "bwa_mem_M": null,
    "bwa_mem_P": null,
    "bwa_mem_T": 30,
    "bwa_mem_Y": true,
    "bwa_mem_output": "test_alignment.sam",
    "bwa_number_of_threads": null,
    "comment": null,
    "create_bam_index": true,
    "description": null,
    "duplicate_scoring_strategy": null,
    "fastp_failed_reads_output_file_name": null,
    "fastp_html_output_file_name": "test_fastp_out.html",
    "fastp_json_output_file_name": "test_fastp_out.json",
    "fastp_minimum_read_length": 25,
    "fastp_read1_adapter_sequence": "GATCGGAAGAGC",
    "fastp_read1_output_file_name": "trimmed_fastp_R1.fastq.gz",
    "fastp_read2_adapter_sequence": "AGATCGGAAGAGC",
    "fastp_read2_output_file_name": "trimmed_fastp_R2.fastq.gz",
    "fastp_unpaired1_output_file_name": null,
    "fastp_unpaired2_output_file_name": null,
    "fgbio_fastq_to_bam_input": [
[
        {
            "class": "File",
            "path": "/Users/shahr2/Documents/test_reference/seracare_0-5_R1_001ad.fastq.gz"
        },
        {
            "class": "File",
            "path": "/Users/shahr2/Documents/test_reference/seracare_0-5_R2_001ad.fastq.gz"
        }
],
[
        {
            "class": "File",
            "path": "/Users/shahr2/Documents/test_reference/seracare_0-5_R1_001ae.fastq.gz"
        },
        {
            "class": "File",
            "path": "/Users/shahr2/Documents/test_reference/seracare_0-5_R2_001ae.fastq.gz"
        }
]
    ],
    "fgbio_fastq_to_bam_output_file_name": null,
    "fgbio_fastq_to_bam_predicted-insert-size": null,
    "fgbio_fastq_to_bam_sort": null,
    "fgbio_fastq_to_bam_umi-tag": null,
    "gatk_base_recalibrator_known_sites": [
        {
            "class": "File",
            "path": "/Users/shahr2/Documents/test_reference/test_fastq_to_bam/known_sites/dbsnp_137_14_16.b37.vcf"
        },
        {
            "class": "File",
            "path": "/Users/shahr2/Documents/test_reference/test_fastq_to_bam/known_sites/Mills_and_1000G_gold_standard-14_16.indels.b37.vcf"
        }
    ],
    "gatk_bqsr_disable_read_filter": null,
    "gatk_bqsr_read_filter": null,
    "gatk_mark_duplicates_assume_sort_order": null,
    "gatk_mark_duplicates_duplication_metrics_file_name": "test_dup_metrics.txt",
    "gatk_mark_duplicates_output_file_name": null,
    "gatk_merge_bam_alignment_output_file_name": null,
    "gatk_merge_sam_files_output_file_name": "test_unmapped.sam",
    "gatk_sam_to_fastq_include_non_pf_reads": null,
    "gatk_sam_to_fastq_include_non_primary_alignments": null,
    "library": "test",
    "merge_sam_files_sort_order": "queryname",
    "optical_duplicate_pixel_distance": 1500,
    "picard_addRG_output_file_name": "test_addRG.bam",
    "picard_fixmateinformation_output_file_name": "test_fx.bam",
    "platform": "ILLUMINA",
    "platform-model": "novaseq",
    "platform-unit": "IDT11",
    "read-group-id": "test",
    "read-structures": [
        "3M2S+T",
        "3M2S+T"
    ],
    "read_name_regex": null,
    "reference_sequence": {
        "class": "File",
        "metadata": {},
        "path": "/Users/shahr2/Documents/test_reference/test_uncollapsed_bam_generation/reference/chr14_chr16.fasta",
        "secondaryFiles": []
    },
    "run-date": null,
    "sample": "test",
    "sequencing-center": "MSKCC",
    "sort_order": "coordinate",
    "unpaired_fastq_file": null,
    "validation_stringency": "LENIENT"
}
```
{% endcode %}

{% hint style="info" %}
Note that the paths in the inputs file are relative to the file itself. It is normally easier to use absolute paths whenever possible.
{% endhint %}

