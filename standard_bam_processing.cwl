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
    'sbg:y': 2889.84375
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
    'sbg:y': 749.21875
  - id: known_sites_1
    type: File
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 2675.78125
  - id: known_sites_2
    type: File?
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 2568.75
  - id: bam_compression_level
    type: int?
    'sbg:x': 643.3026123046875
    'sbg:y': 1835.5625
  - id: validation_stringency
    type: string?
    'sbg:x': 0
    'sbg:y': 107.03125
  - id: duplicate_scoring_strategy
    type: string?
    'sbg:x': 643.3026123046875
    'sbg:y': 1407.4375
  - id: create_bam_index
    type: boolean?
    label: picard_md_create_bam_index_flag
    'sbg:x': 643.3026123046875
    'sbg:y': 1514.46875
  - id: assume_sorted
    type: boolean?
    'sbg:x': 643.3026123046875
    'sbg:y': 1942.59375
  - id: bam_index
    type: boolean?
    label: abra_bam_index_flag
    'sbg:x': 0
    'sbg:y': 3425
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1926.5625
  - id: fastq1
    type: File
    'sbg:x': 0
    'sbg:y': 2996.875
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 856.25
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 963.28125
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 1070.3125
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 1177.34375
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 1284.375
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 1391.40625
  - id: P
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1605.46875
  - id: M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2354.6875
  - id: create_bam_index_1
    type: boolean?
    label: picard_addrg_bam_index_flag
    'sbg:x': 0
    'sbg:y': 3103.90625
  - id: sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 428.125
  - id: output
    type: string?
    label: aln_output_file_name
    'sbg:x': 0
    'sbg:y': 1819.53125
  - id: output_file_name
    type: string?
    label: picard_output_file_name
    'sbg:x': 0
    'sbg:y': 1712.5
  - id: window_size
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: soft_clip_contig
    type: string?
    'sbg:x': 0
    'sbg:y': 535.15625
  - id: scoring_gap_alignments
    type: string?
    'sbg:x': 0
    'sbg:y': 642.1875
  - id: maximum_mixmatch_rate
    type: float?
    'sbg:x': 0
    'sbg:y': 2140.625
  - id: maximum_average_depth
    type: int?
    'sbg:x': 0
    'sbg:y': 2247.65625
  - id: ignore_bad_assembly
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2782.8125
  - id: contig_anchor
    type: string?
    'sbg:x': 0
    'sbg:y': 3210.9375
  - id: consensus_sequence
    type: boolean?
    'sbg:x': 0
    'sbg:y': 3317.96875
  - id: stringency
    type: int?
    label: trim_galore_stringency
    'sbg:x': 0
    'sbg:y': 321.09375
  - id: quality
    type: int?
    label: trim_galore_quality
    'sbg:x': 0
    'sbg:y': 1498.4375
  - id: length
    type: int?
    label: trim_galore_length
    'sbg:x': 0
    'sbg:y': 2461.71875
  - id: adapter2
    type: string?
    'sbg:x': 0
    'sbg:y': 3532.03125
  - id: adapter
    type: string?
    'sbg:x': 0
    'sbg:y': 3639.0625
  - id: bqsr_read_filter
    type: string?
    'sbg:x': 1431.381103515625
    'sbg:y': 1735.53125
  - id: number_of_threads
    type: int?
    label: abra_number_of_threads
    'sbg:x': 0
    'sbg:y': 2033.59375
  - id: trim_galore_number_of_threads
    type: int?
    'sbg:x': 0
    'sbg:y': 214.0625
outputs:
  - id: clstats2
    outputSource:
      - trim_galore_0_6_2/clstats2
    type: File
    'sbg:x': 643.3026123046875
    'sbg:y': 1621.5
  - id: clstats1
    outputSource:
      - trim_galore_0_6_2/clstats1
    type: File
    'sbg:x': 643.3026123046875
    'sbg:y': 1728.53125
  - id: bqsr_bam
    outputSource:
      - calculate_apply_bqsr_cwl/bqsr_bam
    type: File?
    secondaryFiles:
      - ^.bai
    'sbg:x': 2205.4228515625
    'sbg:y': 1819.53125
  - id: md_bam
    outputSource:
      - picard_mark_duplicates_2_8_1/bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 1431.381103515625
    'sbg:y': 1628.5
  - id: output_file
    outputSource:
      - abra_fx_cwl/output_file
    type: File?
    label: indel_realign_targets
    'sbg:x': 1926.0166015625
    'sbg:y': 1738.015625
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
    'sbg:x': 319.125
    'sbg:y': 1770.53125
  - id: picard_mark_duplicates_2_8_1
    in:
      - id: input
        source: alignment/bam
      - id: validation_stringency
        source: validation_stringency
      - id: bam_compression_level
        source: bam_compression_level
      - id: create_bam_index
        source: create_bam_index
      - id: assume_sorted
        source: assume_sorted
      - id: duplicate_scoring_strategy
        source: duplicate_scoring_strategy
    out:
      - id: bam
    run: >-
      command_line_tools/picard_mark_duplicates_2.8.1/picard_mark_duplicates_2.8.1.cwl
    label: picard_mark_duplicates_2.8.1
    'sbg:x': 1106.552978515625
    'sbg:y': 1784.53125
  - id: calculate_apply_bqsr_cwl
    in:
      - id: known_sites_1
        source: known_sites_1
      - id: input
        source: abra_fx_cwl/abra_fx_bam
      - id: known_sites_2
        source: known_sites_2
      - id: reference
        source: reference
      - id: read_filter
        source: bqsr_read_filter
    out:
      - id: bqsr_bam
    run: subworkflows/calculate_apply_bqsr-cwl.cwl
    label: calculate_apply_bqsr.cwl
    'sbg:x': 1926.0166015625
    'sbg:y': 1873.046875
  - id: abra_fx_cwl
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
    run: subworkflows/abra_fx-cwl.cwl
    label: abra_fx.cwl
    'sbg:x': 1431.381103515625
    'sbg:y': 1926.5625
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
        source: M
      - id: read_group_identifier
        source: read_group_identifier
      - id: sort_order
        source: sort_order
      - id: create_bam_index
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
    'sbg:x': 643.3026123046875
    'sbg:y': 2140.625
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
