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
    'sbg:y': 2991.625
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
    'sbg:y': 747.90625
  - id: known_sites_1
    type: File
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 2671.09375
  - id: known_sites_2
    type: File?
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 2564.25
  - id: bam_compression_level
    type: int?
    'sbg:x': 609.8592529296875
    'sbg:y': 1885.609375
  - id: validation_stringency
    type: string?
    'sbg:x': 0
    'sbg:y': 106.84375
  - id: duplicate_scoring_strategy
    type: string?
    'sbg:x': 609.8592529296875
    'sbg:y': 1458.234375
  - id: create_bam_index
    type: boolean?
    label: picard_md_create_bam_index_flag
    'sbg:x': 609.8592529296875
    'sbg:y': 1565.078125
  - id: assume_sorted
    type: boolean?
    'sbg:x': 609.8592529296875
    'sbg:y': 1992.453125
  - id: bam_index
    type: boolean?
    label: abra_bam_index_flag
    'sbg:x': 0
    'sbg:y': 3525.84375
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2030.03125
  - id: fastq1
    type: File
    'sbg:x': 0
    'sbg:y': 3098.46875
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 854.75
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 961.59375
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 1068.4375
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 1175.28125
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 1282.125
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 1388.96875
  - id: P
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1709.5
  - id: M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2350.5625
  - id: create_bam_index_1
    type: boolean?
    label: picard_addrg_bam_index_flag
    'sbg:x': 0
    'sbg:y': 3205.3125
  - id: sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 427.375
  - id: output
    type: string?
    label: aln_output_file_name
    'sbg:x': 0
    'sbg:y': 1923.1875
  - id: output_file_name
    type: string?
    label: picard_output_file_name
    'sbg:x': 0
    'sbg:y': 1816.34375
  - id: window_size
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: soft_clip_contig
    type: string?
    'sbg:x': 0
    'sbg:y': 534.21875
  - id: scoring_gap_alignments
    type: string?
    'sbg:x': 0
    'sbg:y': 641.0625
  - id: maximum_mixmatch_rate
    type: float?
    'sbg:x': 0
    'sbg:y': 2136.875
  - id: maximum_average_depth
    type: int?
    'sbg:x': 0
    'sbg:y': 2243.71875
  - id: ignore_bad_assembly
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2777.9375
  - id: contig_anchor
    type: string?
    'sbg:x': 0
    'sbg:y': 3312.15625
  - id: consensus_sequence
    type: boolean?
    'sbg:x': 0
    'sbg:y': 3419
  - id: stringency
    type: int?
    label: trim_galore_stringency
    'sbg:x': 0
    'sbg:y': 320.53125
  - id: quality
    type: int?
    label: trim_galore_quality
    'sbg:x': 0
    'sbg:y': 1495.8125
  - id: length
    type: int?
    label: trim_galore_length
    'sbg:x': 0
    'sbg:y': 2457.40625
  - id: adapter2
    type: string?
    'sbg:x': 0
    'sbg:y': 3632.6875
  - id: adapter
    type: string?
    'sbg:x': 0
    'sbg:y': 3739.53125
  - id: bqsr_read_filter
    type: string?
    'sbg:x': 1397.937744140625
    'sbg:y': 1792.765625
  - id: number_of_threads
    type: int?
    label: abra_number_of_threads
    'sbg:x': 1252.799560546875
    'sbg:y': 1510.1484375
outputs:
  - id: clstats2
    outputSource:
      - trim_galore_0_6_2/clstats2
    type: File
    'sbg:x': 609.8592529296875
    'sbg:y': 1671.921875
  - id: clstats1
    outputSource:
      - trim_galore_0_6_2/clstats1
    type: File
    'sbg:x': 609.8592529296875
    'sbg:y': 1778.765625
  - id: bqsr_bam
    outputSource:
      - calculate_apply_bqsr_cwl/bqsr_bam
    type: File?
    secondaryFiles:
      - ^.bai
    'sbg:x': 2139.892578125
    'sbg:y': 1869.765625
  - id: md_bam
    outputSource:
      - picard_mark_duplicates_2_8_1/bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 1397.937744140625
    'sbg:y': 1685.921875
  - id: output_file
    outputSource:
      - abra_fx_cwl/output_file
    type: File?
    label: indel_realign_targets
    'sbg:x': 1879.986328125
    'sbg:y': 1788.34375
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
    'sbg:x': 319.125
    'sbg:y': 1806.765625
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
    'sbg:x': 1073.109619140625
    'sbg:y': 1834.765625
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
    'sbg:x': 1879.986328125
    'sbg:y': 1923.1875
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
    'sbg:x': 1397.937744140625
    'sbg:y': 1976.609375
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
    'sbg:x': 609.8592529296875
    'sbg:y': 2190.296875
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
