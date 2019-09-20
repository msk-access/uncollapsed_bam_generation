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
    'sbg:y': 2773.546875
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
    'sbg:y': 640.125
  - id: known_sites_1
    type: File
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 2560.21875
  - id: known_sites_2
    type: File?
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 2453.625
  - id: bam_index
    type: boolean?
    label: abra_bam_index_flag
    'sbg:x': 0
    'sbg:y': 3306.7265625
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1813.7109375
  - id: fastq1
    type: File
    'sbg:x': 0
    'sbg:y': 2880.140625
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 746.7890625
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 853.5234375
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 960.2578125
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 1066.9921875
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 1173.7265625
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 1280.4609375
  - id: P
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1493.859375
  - id: output
    type: string?
    label: aln_output_file_name
    'sbg:x': 0
    'sbg:y': 1707.046875
  - id: output_file_name
    type: string?
    label: picard_output_file_name
    'sbg:x': 0
    'sbg:y': 1600.453125
  - id: window_size
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: soft_clip_contig
    type: string?
    'sbg:x': 0
    'sbg:y': 426.7265625
  - id: scoring_gap_alignments
    type: string?
    'sbg:x': 0
    'sbg:y': 533.4609375
  - id: maximum_mixmatch_rate
    type: float?
    'sbg:x': 0
    'sbg:y': 2026.96875
  - id: maximum_average_depth
    type: int?
    'sbg:x': 0
    'sbg:y': 2133.6328125
  - id: ignore_bad_assembly
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2666.8828125
  - id: contig_anchor
    type: string?
    'sbg:x': 0
    'sbg:y': 3093.3984375
  - id: consensus_sequence
    type: boolean?
    'sbg:x': 0
    'sbg:y': 3200.0625
  - id: stringency
    type: int?
    label: trim_galore_stringency
    'sbg:x': 0
    'sbg:y': 213.3984375
  - id: quality
    type: int?
    label: trim_galore_quality
    'sbg:x': 0
    'sbg:y': 1387.1953125
  - id: length
    type: int?
    label: trim_galore_length
    'sbg:x': 0
    'sbg:y': 2346.9609375
  - id: adapter2
    type: string?
    'sbg:x': 0
    'sbg:y': 3413.390625
  - id: adapter
    type: string?
    'sbg:x': 0
    'sbg:y': 3519.984375
  - id: bqsr_read_filter
    type: string?
    'sbg:x': 1355.10107421875
    'sbg:y': 1675.9921875
  - id: number_of_threads
    type: int?
    label: abra_number_of_threads
    'sbg:x': 0
    'sbg:y': 1920.375
  - id: validation_stringency
    type: string?
    'sbg:x': 0
    'sbg:y': 106.6640625
  - id: bam_compression_level
    type: int?
    'sbg:x': 567.0226440429688
    'sbg:y': 1775.515625
  - id: duplicate_scoring_strategy
    type: string?
    'sbg:x': 567.0226440429688
    'sbg:y': 1349.0703125
  - id: create_bam_index
    type: boolean?
    'sbg:x': 567.0226440429688
    'sbg:y': 1455.734375
  - id: assume_sorted
    type: boolean?
    'sbg:x': 567.0226440429688
    'sbg:y': 1882.109375
  - id: M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2240.296875
  - id: sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 320.0625
  - id: create_bam_index_1
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2986.734375
outputs:
  - id: clstats2
    outputSource:
      - trim_galore_0_6_2/clstats2
    type: File
    'sbg:x': 567.0226440429688
    'sbg:y': 1562.328125
  - id: clstats1
    outputSource:
      - trim_galore_0_6_2/clstats1
    type: File
    'sbg:x': 567.0226440429688
    'sbg:y': 1668.921875
  - id: bqsr_bam
    outputSource:
      - calculate_apply_bqsr_cwl/bqsr_bam
    type: File?
    secondaryFiles:
      - ^.bai
    'sbg:x': 2129.142578125
    'sbg:y': 1759.9921875
  - id: md_bam
    outputSource:
      - picard_mark_duplicates_2_8_1/bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 1355.10107421875
    'sbg:y': 1569.3984375
  - id: output_file
    outputSource:
      - abra_fx_cwl/output_file
    type: File?
    label: indel_realign_targets
    'sbg:x': 1849.7364501953125
    'sbg:y': 1678.5546875
steps:
  - id: trim_galore_0_6_2
    in:
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
    'sbg:x': 319.15625
    'sbg:y': 1717.921875
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
    'sbg:x': 1030.2730712890625
    'sbg:y': 1724.9921875
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
    'sbg:x': 1849.7364501953125
    'sbg:y': 1813.2890625
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
    'sbg:x': 1355.10107421875
    'sbg:y': 1866.5859375
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
    'sbg:x': 567.0226440429688
    'sbg:y': 2079.7734375
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
