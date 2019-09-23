class: Workflow
cwlVersion: v1.0
id: standard_bam_processing_cwl
label: standard_bam_processing.cwl
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: fastq2
    type: File
    'sbg:x': 0
    'sbg:y': 2987.625
  - id: reference
    type: File
    secondaryFiles:
      - .fai
      - ^.dict
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
    'sbg:x': 0
    'sbg:y': 746.984375
  - id: known_sites_1
    type: File
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 2774.234375
  - id: known_sites_2
    type: File?
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 2667.578125
  - id: bam_index
    type: boolean?
    label: abra_bam_index_flag
    'sbg:x': 0
    'sbg:y': 3521.0234375
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2027.4453125
  - id: fastq1
    type: File
    'sbg:x': 0
    'sbg:y': 3094.28125
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 853.6796875
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 960.4140625
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 1067.1484375
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 1173.8828125
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 1280.6171875
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 1387.3515625
  - id: P
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1707.4375
  - id: output
    type: string?
    label: aln_output_file_name
    'sbg:x': 0
    'sbg:y': 1920.75
  - id: output_file_name
    type: string?
    label: picard_output_file_name
    'sbg:x': 0
    'sbg:y': 1814.09375
  - id: window_size
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: soft_clip_contig
    type: string?
    'sbg:x': 0
    'sbg:y': 533.5546875
  - id: scoring_gap_alignments
    type: string?
    'sbg:x': 0
    'sbg:y': 640.2890625
  - id: maximum_mixmatch_rate
    type: float?
    'sbg:x': 0
    'sbg:y': 2240.796875
  - id: maximum_average_depth
    type: int?
    'sbg:x': 0
    'sbg:y': 2347.4921875
  - id: ignore_bad_assembly
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2880.9296875
  - id: contig_anchor
    type: string?
    'sbg:x': 0
    'sbg:y': 3307.6328125
  - id: consensus_sequence
    type: boolean?
    'sbg:x': 0
    'sbg:y': 3414.328125
  - id: stringency
    type: int?
    label: trim_galore_stringency
    'sbg:x': 0
    'sbg:y': 320.1640625
  - id: quality
    type: int?
    label: trim_galore_quality
    'sbg:x': 0
    'sbg:y': 1600.7421875
  - id: length
    type: int?
    label: trim_galore_length
    'sbg:x': 0
    'sbg:y': 2560.8828125
  - id: adapter2
    type: string?
    'sbg:x': 0
    'sbg:y': 3627.71875
  - id: adapter
    type: string?
    'sbg:x': 0
    'sbg:y': 3734.375
  - id: number_of_threads
    type: int?
    label: abra_number_of_threads
    'sbg:x': 0
    'sbg:y': 2134.140625
  - id: validation_stringency
    type: string?
    'sbg:x': 0
    'sbg:y': 106.6953125
  - id: bam_compression_level
    type: int?
    'sbg:x': 643.3182373046875
    'sbg:y': 1882.8046875
  - id: duplicate_scoring_strategy
    type: string?
    'sbg:x': 643.3182373046875
    'sbg:y': 1456.140625
  - id: create_bam_index
    type: boolean?
    'sbg:x': 643.3182373046875
    'sbg:y': 1562.8359375
  - id: assume_sorted
    type: boolean?
    'sbg:x': 643.3182373046875
    'sbg:y': 1989.4609375
  - id: M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2454.1875
  - id: sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 426.859375
  - id: create_bam_index_1
    type: boolean?
    'sbg:x': 0
    'sbg:y': 3200.9375
  - id: trim_galore_number_of_threads
    type: int?
    'sbg:x': 0
    'sbg:y': 213.4296875
  - id: read_filter
    type:
      - 'null'
      - type: array
        items: string
        inputBinding:
          prefix: '--read-filter'
    'sbg:x': 0
    'sbg:y': 1494.046875
outputs:
  - id: clstats2
    outputSource:
      - trim_galore_0_6_2/clstats2
    type: File
    'sbg:x': 643.3182373046875
    'sbg:y': 1669.4921875
  - id: clstats1
    outputSource:
      - trim_galore_0_6_2/clstats1
    type: File
    'sbg:x': 643.3182373046875
    'sbg:y': 1776.1484375
  - id: bqsr_bam
    outputSource:
      - calculate_apply_bqsr/bqsr_bam
    type: File?
    secondaryFiles:
      - ^.bai
    'sbg:x': 2205.4384765625
    'sbg:y': 1920.515625
  - id: md_bam
    outputSource:
      - picard_mark_duplicates_2_8_1/bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 1431.396728515625
    'sbg:y': 1729.859375
  - id: output_file
    outputSource:
      - abra_fx/output_file
    type: File?
    label: indel_realign_targets
    'sbg:x': 1926.0322265625
    'sbg:y': 1785.78125
  - id: standard_bam_alignment_metrics
    outputSource:
      - picard_collect_alignment_summary_metrics_2_8_1/alignment_metrics
    type: File
    'sbg:x': 2511.433837890625
    'sbg:y': 1867.1484375
steps:
  - id: trim_galore_0_6_2
    in:
      - id: number_of_threads
        source: trim_galore_number_of_threads
      - id: adapter
        source: adapter
      - id: adapter2
        source: adapter2
      - id: fastq1
        source: fastq1
      - id: fastq2
        source: fastq2
      - id: length
        source: length
      - id: paired
        default: true
      - id: gzip
        default: true
      - id: quality
        source: quality
      - id: stringency
        source: stringency
      - id: suppress_warn
        default: true
    out:
      - id: clfastq1
      - id: clfastq2
      - id: clstats1
      - id: clstats2
    run: command_line_tools/trim_galore_0.6.2/trim_galore_0.6.2.cwl
    label: trim_galore_0.6.2
    'sbg:x': 319.140625
    'sbg:y': 1818.1484375
  - id: picard_mark_duplicates_2_8_1
    in:
      - id: input
        source: alignment/bam
      - id: validation_stringency
        default: LENIENT
        source: validation_stringency
      - id: bam_compression_level
        default: 0
        source: bam_compression_level
      - id: create_bam_index
        default: true
        source: create_bam_index
      - id: assume_sorted
        default: true
        source: assume_sorted
      - id: duplicate_scoring_strategy
        default: SUM_OF_BASE_QUALITIES
        source: duplicate_scoring_strategy
    out:
      - id: bam
    run: >-
      command_line_tools/picard_mark_duplicates_2.8.1/picard_mark_duplicates_2.8.1.cwl
    label: picard_mark_duplicates_2.8.1
    'sbg:x': 1106.568603515625
    'sbg:y': 1832.1875
  - id: calculate_apply_bqsr
    in:
      - id: known_sites_1
        source: known_sites_1
      - id: input
        source: abra_fx/abra_fx_bam
      - id: known_sites_2
        source: known_sites_2
      - id: reference
        source: reference
      - id: read_filter
        source:
          - read_filter
    out:
      - id: bqsr_bam
    run: subworkflows/calculate_apply_bqsr.cwl
    label: calculate_apply_bqsr.cwl
    'sbg:x': 1926.0322265625
    'sbg:y': 1920.515625
  - id: abra_fx
    in:
      - id: input_bam
        source:
          - picard_mark_duplicates_2_8_1/bam
      - id: reference_fasta
        source: reference
      - id: bam_index
        source: bam_index
      - id: option_bedgraph
        source: option_bedgraph
      - id: window_size
        source: window_size
      - id: soft_clip_contig
        source: soft_clip_contig
      - id: scoring_gap_alignments
        source: scoring_gap_alignments
      - id: maximum_mixmatch_rate
        source: maximum_mixmatch_rate
      - id: maximum_average_depth
        source: maximum_average_depth
      - id: ignore_bad_assembly
        source: ignore_bad_assembly
      - id: contig_anchor
        source: contig_anchor
      - id: consensus_sequence
        source: consensus_sequence
      - id: number_of_threads
        source: number_of_threads
    out:
      - id: abra_fx_bam
      - id: output_file
    run: subworkflows/abra_fx.cwl
    label: abra_fx.cwl
    'sbg:x': 1431.396728515625
    'sbg:y': 1920.515625
  - id: alignment
    in:
      - id: reference
        source: reference
      - id: reads
        source:
          - trim_galore_0_6_2/clfastq1
          - trim_galore_0_6_2/clfastq2
      - id: P
        source: P
      - id: M
        default: true
        source: M
      - id: read_group_identifier
        source: read_group_identifier
      - id: sort_order
        default: coordinate
        source: sort_order
      - id: create_bam_index
        default: true
        source: create_bam_index_1
      - id: read_group_sequnecing_center
        source: read_group_sequnecing_center
      - id: read_group_sequencing_platform
        source: read_group_sequencing_platform
      - id: read_group_sample_name
        source: read_group_sample_name
      - id: read_group_platform_unit
        source: read_group_platform_unit
      - id: read_group_library
        source: read_group_library
      - id: output_file_name
        source: output_file_name
      - id: output
        source: output
    out:
      - id: bam
    run: subworkflows/alignment.cwl
    label: alignment
    'sbg:x': 643.3182373046875
    'sbg:y': 2187.15625
  - id: picard_collect_alignment_summary_metrics_2_8_1
    in:
      - id: input
        source: calculate_apply_bqsr/bqsr_bam
      - id: reference_sequence
        source: reference
    out:
      - id: alignment_metrics
    run: >-
      command_line_tools/picard_collect_alignment_summary_metrics_2.8.1/picard_collect_alignment_summary_metrics_2.8.1.cwl
    label: picard_collect_alignment_summary_metrics_2.8.1
    'sbg:x': 2205.4384765625
    'sbg:y': 1806.8203125
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
