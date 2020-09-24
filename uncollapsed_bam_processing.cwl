class: Workflow
cwlVersion: v1.0
id: uncollapsed_bam_generation
doc: >-
  This is the workflow is written using Common Workflow Language (CWL) version
  1.0 (https://www.commonwl.org/v1.0/) and is used at Memorial Sloan Kettering
  Cancer Center for producing standard bam files from the NY state-approved
  MSK-ACCESS assay. It is meant to be run on a single sample paired-end read 1
  and read 2 fastq's, from Illumina sequencing data, but may be generalizable to
  other sequencing platforms and sequencing panels as well, which produce
  paired-end data.
label: Uncollapsed BAM Generation
$namespaces:
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: input_fgbio_fastq_to_bam
    type: 'File[]'
    doc: Input Fastq.gz files for BAM generation
    'sbg:x': 0
    'sbg:y': 1926
  - id: fgbio_fastq_to_bam_umi-tag
    type: string?
    'sbg:x': 0
    'sbg:y': 2675
  - id: fgbio_fastq_to_bam_sort
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2782
  - id: sequencing-center
    type: string?
    'sbg:x': 0
    'sbg:y': 321
  - id: sample
    type: string?
    'sbg:x': 0
    'sbg:y': 428
  - id: run-date
    type: string?
    'sbg:x': 0
    'sbg:y': 535
  - id: read-structures
    type: 'string[]?'
    'sbg:x': 0
    'sbg:y': 749
  - id: read-group-id
    type: string?
    'sbg:x': 0
    'sbg:y': 856
  - id: fgbio_fastq_to_bam_predicted-insert-size
    type: int?
    'sbg:x': 0
    'sbg:y': 2889
  - id: platform-unit
    type: string?
    'sbg:x': 0
    'sbg:y': 1284
  - id: platform-model
    type: string?
    'sbg:x': 0
    'sbg:y': 1391
  - id: platform
    type: string?
    'sbg:x': 0
    'sbg:y': 1498
  - id: fgbio_fastq_to_bam_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 2996
  - id: library
    type: string?
    'sbg:x': 0
    'sbg:y': 1819
  - id: description
    type: string?
    'sbg:x': 0
    'sbg:y': 4173
  - id: comment
    type: string?
    'sbg:x': 0
    'sbg:y': 4280
  - id: validation_stringency
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: unpaired_fastq_file
    type: string?
    doc: Name of the Unpaired Fastq File
    'sbg:x': 0
    'sbg:y': 107
  - id: gatk_sam_to_fastq_include_non_primary_alignments
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2033
  - id: gatk_sam_to_fastq_include_non_pf_reads
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2140
  - id: R1_output_fastq
    type: string?
    doc: Name of the R1 output Fastq File
    'sbg:x': 0
    'sbg:y': 1177
  - id: R2_output_fastq
    type: string?
    doc: Name of the R2 Fastq File
    'sbg:x': 0
    'sbg:y': 1070
  - id: reference_sequence
    type: File
    secondaryFiles:
      - .amb
      - .fai
      - .sa
      - .dict
      - .ann
      - ' .bwt'
      - .pac
    'sbg:x': 0
    'sbg:y': 642
  - id: fastp_unpaired2_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 3210
  - id: fastp_unpaired1_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 3317
  - id: fastp_read2_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 3424
  - id: fastp_read2_adapter_sequence
    type: string?
    'sbg:x': 0
    'sbg:y': 3531
  - id: fastp_read1_output_file_name
    type: string
    'sbg:x': 0
    'sbg:y': 3638
  - id: fastp_read1_adapter_sequence
    type: string?
    'sbg:x': 0
    'sbg:y': 3745
  - id: fastp_minimum_read_length
    type: int?
    'sbg:x': 0
    'sbg:y': 3852
  - id: fastp_json_output_file_name
    type: string
    'sbg:x': 0
    'sbg:y': 3959
  - id: fatp_html_output_file_name
    type: string
    'sbg:x': 0
    'sbg:y': 3103
  - id: fastp_failed_reads_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 4066
  - id: bwa_mem_Y
    type: boolean?
    doc: use soft clipping for supplementary alignments
    'sbg:x': 0
    'sbg:y': 4387
  - id: bwa_mem_T
    type: int?
    doc: 'minimum score to output [30]'
    'sbg:x': 0
    'sbg:y': 4494
  - id: bwa_mem_t
    type: int?
    doc: Number of Threads
    'sbg:x': 0
    'sbg:y': 4601
  - id: sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 214
  - id: bwa_mem_R
    type: string?
    doc: 'read group header line such as ''@RG\tID:foo\tSM:bar'' [null]'
    'sbg:x': 0
    'sbg:y': 4708
  - id: bwa_mem_P
    type: boolean?
    doc: skip pairing; mate rescue performed unless -S also in use
    'sbg:x': 0
    'sbg:y': 4815
  - id: picard_addRG_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 1712
  - id: bwa_mem_output
    type: string?
    'sbg:x': 0
    'sbg:y': 4922
  - id: bwa_mem_M
    type: boolean?
    doc: mark shorter split hits as secondary
    'sbg:x': 0
    'sbg:y': 5029
  - id: bwa_mem_K
    type: int?
    doc: >-
      process INT input bases in each batch regardless of nThreads (for
      reproducibility) []
    'sbg:x': 0
    'sbg:y': 5136
  - id: create_bam_index
    type: boolean?
    'sbg:x': 1583.0999755859375
    'sbg:y': 2805.5
  - id: gatk_merge_bam_alignment_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 2247
  - id: optical_duplicate_pixel_distance
    type: int?
    'sbg:x': 2067.62255859375
    'sbg:y': 1904.5
  - id: duplicate_scoring_strategy
    type: string?
    'sbg:x': 2067.62255859375
    'sbg:y': 2937.5
  - id: read_name_regex
    type: string?
    'sbg:x': 0
    'sbg:y': 963
  - id: gatk_mark_duplicates_output_file_name
    type: string?
    'sbg:x': 2067.62255859375
    'sbg:y': 2188.5
  - id: gatk_mark_duplicates_duplication_metrics_file_name
    type: string
    'sbg:x': 2067.62255859375
    'sbg:y': 2295.5
  - id: gatk_mark_duplicates_assume_sort_order
    type: string?
    'sbg:x': 2067.62255859375
    'sbg:y': 2402.5
  - id: abra2_window_size
    type: string?
    doc: Processing window size and overlap
    'sbg:x': 2839.173828125
    'sbg:y': 2247
  - id: abra2_soft_clip_contig
    type: string?
    'sbg:x': 2839.173828125
    'sbg:y': 2354
  - id: abra2_scoring_gap_alignments
    type: string?
    'sbg:x': 2839.173828125
    'sbg:y': 2461
  - id: abra2_output_bams
    type:
      - string
      - type: array
        items: string
    doc: Required list of output sam or bam file
    'sbg:x': 2839.173828125
    'sbg:y': 2568
  - id: abra2_maximum_average_depth
    type: int?
    'sbg:x': 2839.173828125
    'sbg:y': 2996
  - id: abra2_bam_index
    type: boolean?
    'sbg:x': 2839.173828125
    'sbg:y': 3317
  - id: abra2_contig_anchor
    type: string?
    'sbg:x': 2839.173828125
    'sbg:y': 3103
  - id: abra2_consensus_sequence
    type: boolean?
    'sbg:x': 2839.173828125
    'sbg:y': 3210
  - id: bedtools_merge_distance_between_features
    type: int?
    'sbg:x': 2839.173828125
    'sbg:y': 2033
  - id: abra2_maximum_mixmatch_rate
    type: float?
    doc: |-
      ax allowed mismatch rate when mapping
      reads back to contigs (default: 0.05)
    'sbg:x': 2839.173828125
    'sbg:y': 2889
  - id: bedtools_genomecov_option_bedgraph
    type: boolean?
    'sbg:x': 2839.173828125
    'sbg:y': 2140
  - id: picard_fixmateinformation_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 1605
  - id: abra2_no_sort
    type: boolean?
    'sbg:x': 2839.173828125
    'sbg:y': 2675
  - id: abra2_no_edge_complex_indel
    type: boolean?
    'sbg:x': 2839.173828125
    'sbg:y': 2782
  - id: gatk_bqsr_read_filter
    type:
      - 'null'
      - type: array
        items: string
        inputBinding:
          prefix: '--read-filter'
    'sbg:x': 0
    'sbg:y': 2354
  - id: gatk_base_recalibrator_known_sites
    type:
      type: array
      items: File
      inputBinding:
        prefix: '--known-sites'
    'sbg:x': 0
    'sbg:y': 2568
  - id: gatk_bqsr_disable_read_filter
    type:
      - 'null'
      - type: array
        items: string
        inputBinding:
          prefix: '--disable-read-filter'
    'sbg:x': 0
    'sbg:y': 2461
  - id: base_recalibrator_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 5243
  - id: apply_bqsr_output_file_name
    type: string?
    'sbg:x': 3370.38330078125
    'sbg:y': 2854.5
outputs:
  - id: gatk_sam_to_fastq_unpaired_fastq
    outputSource:
      - gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_unpaired_fastq
    type: File?
    'sbg:x': 1583.0999755859375
    'sbg:y': 2437.5
  - id: fastp_unpaired2_output
    outputSource:
      - fastp_0_20_1/fastp_unpaired2_output
    type: File?
    'sbg:x': 2067.62255859375
    'sbg:y': 2509.5
  - id: fastp_unpaired1_output
    outputSource:
      - fastp_0_20_1/fastp_unpaired1_output
    type: File?
    'sbg:x': 2067.62255859375
    'sbg:y': 2616.5
  - id: fastp_json_output
    outputSource:
      - fastp_0_20_1/fastp_json_output
    type: File
    'sbg:x': 2067.62255859375
    'sbg:y': 2723.5
  - id: fastp_html_output
    outputSource:
      - fastp_0_20_1/fastp_html_output
    type: File
    'sbg:x': 2067.62255859375
    'sbg:y': 2830.5
  - id: picard_mark_duplicates_metrics
    outputSource:
      - picard_mark_duplicates_4_1_8_1/picard_mark_duplicates_metrics
    type: File
    'sbg:x': 3370.38330078125
    'sbg:y': 2388.5
  - id: indel_realignment_bam
    outputSource:
      - indel_realignment/indel_realignment_bam
    type: File
    doc: This bam file will be used for collapsing
    secondaryFiles:
      - ^.bai
    'sbg:x': 3967.08837890625
    'sbg:y': 2519
  - id: uncollapsed_bam
    outputSource:
      - base_quality_recalibration/gatk_apply_bqsr_bam
    type: File?
    doc: This is the uncollapsed bam used for SV and MSI
    secondaryFiles:
      - ^.bai
    'sbg:x': 4453.85205078125
    'sbg:y': 2568
  - id: gatk_collect_alignment_summary_metrics_txt
    outputSource:
      - >-
        gatk_collect_alignment_summary_metrics_4_1_8_0/gatk_collect_alignment_summary_metrics_txt
    type: File
    'sbg:x': 4854.41455078125
    'sbg:y': 2621.5
steps:
  - id: fgbio_fastq_to_bam_1_2_0
    in:
      - id: input
        source:
          - input_fgbio_fastq_to_bam
      - id: output_file_name
        source: fgbio_fastq_to_bam_output_file_name
      - id: read-structures
        source:
          - read-structures
      - id: sort
        source: fgbio_fastq_to_bam_sort
      - id: umi-tag
        source: fgbio_fastq_to_bam_umi-tag
      - id: read-group-id
        source: read-group-id
      - id: sample
        source: sample
      - id: library
        source: library
      - id: platform
        source: platform
      - id: platform-unit
        source: platform-unit
      - id: platform-model
        source: platform-model
      - id: sequencing-center
        source: sequencing-center
      - id: predicted-insert-size
        source: fgbio_fastq_to_bam_predicted-insert-size
      - id: description
        source: description
      - id: comment
        source: comment
      - id: run-date
        source: run-date
    out:
      - id: fgbio_fastq_to_bam_ubam
    run: command_line_tools/fgbio_fastq_to_bam_1.2.0/fgbio_fastq_to_bam_1.2.0.cwl
    label: fgbio_fastq_to_bam_1.2.0
    'sbg:x': 477.953125
    'sbg:y': 2516.5
  - id: gatk_sam_to_fastq_4_1_8_0
    in:
      - id: input
        source: fgbio_fastq_to_bam_1_2_0/fgbio_fastq_to_bam_ubam
      - id: fastq
        source: R1_output_fastq
      - id: include_non_pf_reads
        source: gatk_sam_to_fastq_include_non_pf_reads
      - id: include_non_primary_alignments
        source: gatk_sam_to_fastq_include_non_primary_alignments
      - id: reference_sequence
        source: reference_sequence
      - id: second_end_fastq
        source: R2_output_fastq
      - id: unpaired_fastq
        source: unpaired_fastq_file
      - id: validation_stringency
        source: validation_stringency
    out:
      - id: gatk_sam_to_fastq_fastq
      - id: gatk_sam_to_fastq_unpaired_fastq
      - id: gatk_sam_to_fastq_second_end_fastq
    run: command_line_tools/gatk_sam_to_fastq_4.1.8.0/gatk_sam_to_fastq_4.1.8.0.cwl
    label: GATK-SamToFastq
    'sbg:x': 1025.4615478515625
    'sbg:y': 2572.5
  - id: fastp_0_20_1
    in:
      - id: read1_input
        source: gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_fastq
      - id: read1_output_path
        source: fastp_read1_output_file_name
      - id: read2_input
        source: gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_second_end_fastq
      - id: read2_output_path
        source: fastp_read2_output_file_name
      - id: unpaired1_path
        source: fastp_unpaired1_output_file_name
      - id: unpaired2_path
        source: fastp_unpaired2_output_file_name
      - id: failed_reads_path
        source: fastp_failed_reads_output_file_name
      - id: read1_adapter_sequence
        source: fastp_read1_adapter_sequence
      - id: read2_adapter_sequence
        source: fastp_read2_adapter_sequence
      - id: minimum_read_length
        source: fastp_minimum_read_length
      - id: json_output_path
        source: fastp_json_output_file_name
      - id: html_output_path
        source: fatp_html_output_file_name
    out:
      - id: fastp_json_output
      - id: fastp_html_output
      - id: fastp_read1_output
      - id: fastp_read2_output
      - id: fastp_unpaired1_output
      - id: fastp_unpaired2_output
    run: command_line_tools/fastp_0.20.1/fastp_0.20.1.cwl
    label: fastp_0.20.1
    'sbg:x': 1583.0999755859375
    'sbg:y': 2621.5
  - id: alignment
    in:
      - id: create_bam_index
        source: create_bam_index
      - id: output_file_name
        source: picard_addRG_output_file_name
      - id: read_group_description
        source: description
      - id: read_group_identifier
        source: read-group-id
      - id: read_group_library
        source: library
      - id: read_group_platform_unit
        source: platform-unit
      - id: read_group_run_date
        source: run-date
      - id: read_group_sample_name
        source: sample
      - id: read_group_sequencing_center
        source: sequencing-center
      - id: read_group_sequencing_platform
        source: platform
      - id: sort_order
        source: sort_order
      - id: validation_stringency
        source: validation_stringency
      - id: reference
        source: reference_sequence
      - id: reads
        source:
          - fastp_0_20_1/fastp_read1_output
          - fastp_0_20_1/fastp_read2_output
      - id: output
        source: bwa_mem_output
      - id: P
        source: bwa_mem_P
      - id: M
        source: bwa_mem_M
      - id: sample_id
        source: sample
      - id: R
        source: bwa_mem_R
      - id: t
        source: bwa_mem_t
      - id: T
        source: bwa_mem_T
      - id: 'Y'
        source: bwa_mem_Y
      - id: K
        source: bwa_mem_K
    out:
      - id: picard_add_or_replace_read_groups_bam
    run: subworkflows/alignment/alignment.cwl
    label: alignment
    'sbg:x': 2067.62255859375
    'sbg:y': 3191.5
  - id: gatk_merge_bam_alignment_4_1_8_0
    in:
      - id: unmapped_bam
        source: fgbio_fastq_to_bam_1_2_0/fgbio_fastq_to_bam_ubam
      - id: reference
        source: reference_sequence
      - id: output_file_name
        source: gatk_merge_bam_alignment_output_file_name
      - id: aligned_bam
        source:
          - alignment/picard_add_or_replace_read_groups_bam
      - id: validation_stringency
        source: validation_stringency
      - id: create_index
        source: create_bam_index
    out:
      - id: gatk_merge_bam_alignment_bam
    run: >-
      command_line_tools/gatk_merge_bam_alignment_4.1.8.0/gatk_merge_bam_alignment_4.1.8.0.cwl
    label: GATK-MergeBamAlignment
    'sbg:x': 2067.62255859375
    'sbg:y': 2046.5
  - id: picard_mark_duplicates_4_1_8_1
    in:
      - id: input
        source: gatk_merge_bam_alignment_4_1_8_0/gatk_merge_bam_alignment_bam
      - id: output_file_name
        source: gatk_mark_duplicates_output_file_name
      - id: duplication_metrics
        source: gatk_mark_duplicates_duplication_metrics_file_name
      - id: assume_sort_order
        source: gatk_mark_duplicates_assume_sort_order
      - id: validation_stringency
        source: validation_stringency
      - id: create_bam_index
        source: create_bam_index
      - id: read_name_regex
        source: read_name_regex
      - id: duplicate_scoring_strategy
        source: duplicate_scoring_strategy
      - id: optical_duplicate_pixel_distance
        source: optical_duplicate_pixel_distance
    out:
      - id: picard_mark_duplicates_bam
      - id: picard_mark_duplicates_metrics
    run: >-
      command_line_tools/picard_mark_duplicates_4.1.8.1/picard_mark_duplicates_4.1.8.1.cwl
    label: picard_mark_duplicates_4.1.8.1
    'sbg:x': 2839.173828125
    'sbg:y': 1870
  - id: indel_realignment
    in:
      - id: window_size
        source: abra2_window_size
      - id: soft_clip_contig
        source: abra2_soft_clip_contig
      - id: scoring_gap_alignments
        source: abra2_scoring_gap_alignments
      - id: reference_fasta
        source: reference_sequence
      - id: no_sort
        source: abra2_no_sort
      - id: maximum_mixmatch_rate
        source: abra2_maximum_mixmatch_rate
      - id: maximum_average_depth
        source: abra2_maximum_average_depth
      - id: input_bam
        source:
          - picard_mark_duplicates_4_1_8_1/picard_mark_duplicates_bam
      - id: contig_anchor
        source: abra2_contig_anchor
      - id: consensus_sequence
        source: abra2_consensus_sequence
      - id: bam_index
        source: abra2_bam_index
      - id: option_bedgraph
        source: bedtools_genomecov_option_bedgraph
      - id: no_edge_complex_indel
        source: abra2_no_edge_complex_indel
      - id: distance_between_features
        source: bedtools_merge_distance_between_features
      - id: output_bams
        source:
          - abra2_output_bams
      - id: validation_stringency
        source: validation_stringency
      - id: sort_order
        source: sort_order
      - id: output_file_name
        source: picard_fixmateinformation_output_file_name
      - id: create_bam_index
        source: create_bam_index
    out:
      - id: indel_realignment_bam
    run: subworkflows/indel_realignment/indel_realignment.cwl
    label: indel_realignment
    'sbg:x': 3370.38330078125
    'sbg:y': 2621.5
  - id: base_quality_recalibration
    in:
      - id: input
        source: indel_realignment/indel_realignment_bam
      - id: reference
        source: reference_sequence
      - id: read_filter
        source:
          - gatk_bqsr_read_filter
      - id: known_sites
        source:
          - gatk_base_recalibrator_known_sites
      - id: base_recalibrator_output_file_name
        source: base_recalibrator_output_file_name
      - id: disable_read_filter
        source:
          - gatk_bqsr_disable_read_filter
      - id: apply_bqsr_create_output_bam_index
        source: create_bam_index
      - id: apply_bqsr_output_file_name
        source: apply_bqsr_output_file_name
    out:
      - id: gatk_apply_bqsr_bam
    run: subworkflows/base_quality_recalibration/base_quality_recalibration.cwl
    label: base_quality_recalibration
    'sbg:x': 3967.08837890625
    'sbg:y': 2675
  - id: gatk_collect_alignment_summary_metrics_4_1_8_0
    in:
      - id: input
        source: base_quality_recalibration/gatk_apply_bqsr_bam
    out:
      - id: gatk_collect_alignment_summary_metrics_txt
    run: >-
      command_line_tools/gatk_collect_alignment_summary_metrics_4.1.8.0/gatk_collect_alignment_summary_metrics_4.1.8.0.cwl
    label: GATK-CollectAlignmentSummaryMetrics
    'sbg:x': 4453.85205078125
    'sbg:y': 2675
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
$schemas:
  - 'https://schema.org/docs/schema_org_rdfa.html'
's:author':
  - class: 's:Person'
    's:email': 'mailto:shahr2@mskcc.org'
    's:identifier': ''
    's:name': Ronak Shah
's:citation': ''
's:codeRepository': 'https://github.com/msk-access/standard_bam_processing'
's:contributor':
  - class: 's:Person'
    's:email': 'mailto:shahr2@mskcc.org'
    's:identifier': 'https://orcid.org/0000-0001-9042-6213'
    's:name': Ronak Shah
's:dateCreated': '2020-09-23'
's:license': 'https://spdx.org/licenses/Apache-2.0'
