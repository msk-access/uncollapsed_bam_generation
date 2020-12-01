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
| :---: | :---: | :---: |
| **sequencing-center** | The sequencing center from which the data originated |  |
| **sample** | The name of the sequenced sample. |  |
| **run-date** | Date the run was produced, to insert into the read group header \(Iso8601Date\) |  |
| **read-group-id** | Read group ID to use in the file header |  |
| **platform-unit** | Read-Group Platform Unit \(eg. run barcode\) |  |
| **platform-model** | Platform model to insert into the group header \(ex. miseq, hiseq2500, hiseqX\) |  |
| **platform** | Read-Group platform \(e.g. ILLUMINA, SOLID\). |  |
| **library** | The name/ID of the sequenced library. |  |
| **description** | Description of the read group. |  |
| **comment** | Comments to include in the output file’s header. |  |
| **validation\_stringency** | Validation stringency for all SAM files read by this program. Setting stringency to SILENT can improve performance when processing a BAM file in which variable-length data \(read, qualities, tags\) do not otherwise need to be decoded. The --VALIDATION\_STRINGENCY argument is an enumerated type \(ValidationStringency\), which can have one of the following values: STRICT or LENIENT or SILENT |  |
| **sort\_order** | GATK: The order in which the reads should be output. |  |
| **create\_bam\_index** | GATK: Generate BAM index file when possible |  |
| **reference\_sequence** | Reference sequence file. Please include ".fai", "^.dict", ".amb" , ".sa", ".bwt", ".pac", ".ann" as secondary files if they are not present in the same location as the ".fasta" file |  |

### Fgbio [FastqToBam](https://github.com/msk-access/cwl-commandlinetools/tree/develop/fgbio_fastq_to_bam_1.2.0)

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :---: | :---: |
| **fgbio\_fastq\_to\_bam\_umi-tag** | Tag in which to store molecular barcodes/UMIs. |  |
| **fgbio\_fastq\_to\_bam\_sort** | If true, query-name sort the BAM file, otherwise preserve input order. |  |
| **fgbio\_fastq\_to\_bam\_input** | Fastq files corresponding to each sequencing read \( e.g. R1, I1, etc.\). Please refer to the [template file](inputs-description.md#template-inputs-file) to get this correct.  |  |
| \*\*\*\*[**read-structures**](https://github.com/fulcrumgenomics/fgbio/wiki/Read-Structures)\*\*\*\* | Read structures, one for each of the FASTQs. Refer to the [tool ](https://github.com/fulcrumgenomics/fgbio/wiki/Read-Structures)for more details |  |
| **fgbio\_fastq\_to\_bam\_predicted-insert-size** | Predicted median insert size, to insert into the read group header |  |
| **fgbio\_fastq\_to\_bam\_output\_file\_name** | The output SAM or BAM file to be written. |  |

### Picard [MergeSamFiles](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_merge_sam_files_4.1.8.0)

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :---: | :---: |
| **gatk\_merge\_sam\_files\_output\_file\_name** | SAM or BAM file to write the merged result to |  |
| **merge\_sam\_files\_sort\_order** | Sort order of output file |  |

### Picard [SamToFastq](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_sam_to_fastq_4.1.8.0)

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :---: | :---: |
| **unpaired\_fastq\_file** | unpaired fastq output file name |  |
| **R1\_output\_fastq** | Read1 fastq.gz output file name |  |
| **R2\_output\_fastq** | Read2 fastq.gz output file name |  |
| **gatk\_sam\_to\_fastq\_include\_non\_primary\_alignments** | If true, include non-primary alignments in the output. Support of non-primary alignments in SamToFastq is not comprehensive, so there may be exceptions if this is set to true and there are paired reads with non-primary alignments. |  |
| **gatk\_sam\_to\_fastq\_include\_non\_pf\_reads** | Include non-PF reads from the SAM file into the output FASTQ files. PF means 'passes filtering'. Reads whose 'not passing quality controls' flag is set are non-PF reads. See GATK Dictionary for more info. |  |

### [Fastp](https://github.com/msk-access/cwl-commandlinetools/tree/develop/fastp_0.20.1)

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :---: | :---: |
| **fastp\_unpaired1\_output\_file\_name** | For PE input, if read1 passed QC but read2 not, it will be written to unpaired1. Default is to discard it. |  |
| **fastp\_unpaired2\_output\_file\_name** | For PE input, if read2 passed QC but read1 not, it will be written to unpaired2. If --unpaired2 is same as --unpaired1 \(default mode\), both unpaired reads will be written to this same file. |  |
| **fastp\_read1\_adapter\_sequence** | the adapter for read1. For SE data, if not specified, the adapter will be auto-detected. For PE data, this is used if R1/R2 are found not overlapped. |  |
| **fastp\_read2\_adapter\_sequence** | The adapter for read2 \(PE data only\). This is used if R1/R2 are found not overlapped. If not specified, it will be the same as  \(string\) | AGATCGGAAGAGC |
| **fastp\_read1\_output\_file\_name** | Read1 output File Name | 1 |
| **fastp\_read2\_output\_file\_name** | Read2 output File Name |  |
| **fastp\_minimum\_read\_length** | reads shorter than length\_required will be discarded | 15 |
| **fastp\_json\_output\_file\_name** | the json format report file name |  |
| **fastp\_html\_output\_file\_name** | the html format report file name |  |
| f**astp\_failed\_reads\_output\_file\_name** | specify the file to store reads that cannot pass the filters. |  |

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
| **picard\_addRG\_output\_file\_name** | Output BAM file name |  |
| **picard\_addRG\_sort\_order** | Sort order for the BAM file |  |

### GATK [MergeBamAlignment](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_merge_bam_alignment_4.1.8.0)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **gatk\_merge\_bam\_alignment\_output\_file\_name** | Output BAM file name |  |

### Picard [MarkDuplicates](https://github.com/msk-access/cwl-commandlinetools/tree/develop/picard_mark_duplicates_4.1.8.1)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **optical\_duplicate\_pixel\_distance** | The maximum offset between two duplicate clusters in order to consider them optical duplicates. The default is appropriate for unpatterned versions of the Illumina platform. For the patterned flowcell models, 2500 is more appropriate. For other platforms and models, users should experiment to find what works best. |  |
| **read\_name\_regex** | Regular expression that can be used to parse read names in the incoming SAM file. Read names are parsed to extract three variables: tile/region, x coordinate and y coordinate. These values are used to estimate the rate of optical duplication in order to give a more accurate estimated library size. Set this option to null to disable optical duplicate detection, e.g. for RNA-seq or other data where duplicate sets are extremely large and estimating library complexity is not an aim. Note that without optical duplicate counts, library size estimation will be inaccurate. The regular expression should contain three capture groups for the three variables, in order. It must match the entire read name. Note that if the default regex is specified, a regex match is not actually done, but instead the read name is split on colon character. For 5 element names, the 3rd, 4th and 5th elements are assumed to be tile, x and y values. For 7 element names \(CASAVA 1.8\), the 5th, 6th, and 7th elements are assumed to be tile, x and y values. |  |
| **duplicate\_scoring\_strategy** | The scoring strategy for choosing the non-duplicate among candidates. |  |
| **gatk\_mark\_duplicates\_output\_file\_name** | The output file to write marked records to |  |
| **gatk\_mark\_duplicates\_duplication\_metrics\_file\_name** | File to write duplication metrics to |  |
| **gatk\_mark\_duplicates\_assume\_sort\_order** | If not null, assume that the input file has this order even if the header says otherwise. |  |

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
| **gatk\_base\_recalibrator\_known\_sites** | One or more databases of known polymorphic sites used to exclude regions around known polymorphisms from analysis |  |
| **gatk\_bqsr\_read\_filter** | Read filters to be applied before analysis |  |
| **base\_recalibrator\_output\_file\_name** | The output recalibration table file to create |  |

### GATK [ApplyBQSR](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_apply_bqsr_4.1.8.1)

| **Argument Name** | **Summary** | **Default Value** |
| :---: | :--- | :---: |
| **apply\_bqsr\_output\_file\_name** | The output BAM file |  |
| **gatk\_bqsr\_disable\_read\_filte**r | Read filters to be disabled before analysis | GoodCigarReadFilter |

## Template inputs file

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
    "picard_addRG_sort_order": "queryname",
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

