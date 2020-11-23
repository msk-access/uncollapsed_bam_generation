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

### [Fgbio FastqToBam](https://github.com/msk-access/cwl-commandlinetools/tree/develop/fgbio_fastq_to_bam_1.2.0)

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :--- | :---: |

 
### [Picard MergeSamFiles](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_merge_sam_files_4.1.8.0)

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :--- | :---: |

### [Picard SamToFastq](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_sam_to_fastq_4.1.8.0)

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


### [Picard MarkDuplicates](https://github.com/msk-access/cwl-commandlinetools/tree/develop/picard_mark_duplicates_4.1.8.1)

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

### Base Quality Score Recalibration using GATK [BaseRecalibrator](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_base_recalibrator_4.1.8.1) & [ApplyBQSR](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_apply_bqsr_4.1.8.1) parameters:

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :--- | :---: |
| **known\_sites\_1 & known\_sites\_2** | One or more databases of known polymorphic sites used to exclude regions around known polymorphisms from analysis |  |
| **read\_filter** | Read filters to be applied before analysis | GoodCigarReadFilter |

## Template inputs file:

Below is the template input yaml file generated using:

{% code title="make-template" %}
```bash
cwltool --make-template standard_bam_processing.cwl
```
{% endcode %}

{% hint style="warning" %}
**Parameters not marked as optional are required**
{% endhint %}

{% code title="template-inputs.json" %}
```json
{
    "R1_output_fastq": null,
    "R2_output_fastq": null,
    "abra2_bam_index": null,
    "abra2_consensus_sequence": null,
    "abra2_contig_anchor": null,
    "abra2_maximum_average_depth": null,
    "abra2_maximum_mixmatch_rate": null,
    "abra2_no_edge_complex_indel": null,
    "abra2_no_sort": null,
    "abra2_output_bams": null,
    "abra2_scoring_gap_alignments": null,
    "abra2_soft_clip_contig": null,
    "abra2_window_size": null,
    "apply_bqsr_output_file_name": null,
    "base_recalibrator_output_file_name": null,
    "bedtools_genomecov_option_bedgraph": null,
    "bedtools_merge_distance_between_features": null,
    "bwa_mem_K": null,
    "bwa_mem_M": null,
    "bwa_mem_P": null,
    "bwa_mem_T": null,
    "bwa_mem_Y": null,
    "bwa_mem_output": null,
    "bwa_number_of_threads": null,
    "comment": null,
    "create_bam_index": null,
    "description": null,
    "duplicate_scoring_strategy": null,
    "fastp_failed_reads_output_file_name": null,
    "fastp_html_output_file_name": null,
    "fastp_json_output_file_name": null,
    "fastp_minimum_read_length": null,
    "fastp_read1_adapter_sequence": null,
    "fastp_read1_output_file_name": null,
    "fastp_read2_adapter_sequence": null,
    "fastp_read2_output_file_name": null,
    "fastp_unpaired1_output_file_name": null,
    "fastp_unpaired2_output_file_name": null,
    "fgbio_fastq_to_bam_input": null,
    "fgbio_fastq_to_bam_output_file_name": null,
    "fgbio_fastq_to_bam_predicted-insert-size": null,
    "fgbio_fastq_to_bam_sort": null,
    "fgbio_fastq_to_bam_umi-tag": null,
    "gatk_base_recalibrator_known_sites": null,
    "gatk_bqsr_disable_read_filter": null,
    "gatk_bqsr_read_filter": null,
    "gatk_mark_duplicates_assume_sort_order": null,
    "gatk_mark_duplicates_duplication_metrics_file_name": null,
    "gatk_mark_duplicates_output_file_name": null,
    "gatk_merge_bam_alignment_output_file_name": null,
    "gatk_merge_sam_files_output_file_name": null,
    "gatk_sam_to_fastq_include_non_pf_reads": null,
    "gatk_sam_to_fastq_include_non_primary_alignments": null,
    "library": null,
    "merge_sam_files_sort_order": null,
    "optical_duplicate_pixel_distance": null,
    "picard_addRG_output_file_name": null,
    "picard_fixmateinformation_output_file_name": null,
    "platform": null,
    "platform-model": null,
    "platform-unit": null,
    "read-group-id": null,
    "read-structures": null,
    "read_name_regex": null,
    "reference_sequence": null,
    "run-date": null,
    "sample": null,
    "sequencing-center": null,
    "sort_order": null,
    "unpaired_fastq_file": null,
    "validation_stringency": null
}
```
{% endcode %}

{% hint style="info" %}
Note that the paths in the inputs file are relative to the file itself. It is normally easier to use absolute paths whenever possible.
{% endhint %}

