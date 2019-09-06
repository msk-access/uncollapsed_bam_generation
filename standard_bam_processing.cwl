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
    'sbg:y': 1707.046875
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
    'sbg:y': 213.328125
  - id: known_sites_1
    type: File
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 1493.671875
  - id: known_sites_2
    type: File?
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 1387.03125
  - id: bam_compression_level
    type: int?
    'sbg:x': 523.8980712890625
    'sbg:y': 1043.1015625
  - id: paired
    type: boolean
    'sbg:x': 0
    'sbg:y': 960.375
  - id: gzip
    type: boolean
    'sbg:x': 0
    'sbg:y': 1600.359375
  - id: validation_stringency
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: duplicate_scoring_strategy
    type: string?
    'sbg:x': 523.8980712890625
    'sbg:y': 616.4921875
  - id: create_bam_index
    type: boolean?
    'sbg:x': 523.8980712890625
    'sbg:y': 723.1796875
  - id: assume_sorted
    type: boolean?
    'sbg:x': 523.8980712890625
    'sbg:y': 1149.7421875
  - id: bam_index
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2026.96875
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1173.703125
  - id: fastq1
    type: File
    'sbg:x': 0
    'sbg:y': 1813.6875
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 320.015625
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 426.75
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 533.484375
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 640.21875
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 746.953125
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 853.6875
  - id: P
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1067.015625
  - id: M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1280.390625
  - id: create_bam_index_1
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1920.328125
  - id: sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 106.6875
outputs:
  - id: clstats2
    outputSource:
      - trim_galore_0_6_2/clstats2
    type: File
    'sbg:x': 1405.265869140625
    'sbg:y': 65.59613800048828
  - id: clstats1
    outputSource:
      - trim_galore_0_6_2/clstats1
    type: File
    'sbg:x': 1592.22412109375
    'sbg:y': 326.3489685058594
  - id: bqsr_bam
    outputSource:
      - calculate_apply_bqsr_cwl/output
    type: File?
    'sbg:x': 1946.2691650390625
    'sbg:y': 646.6942138671875
  - id: md_bam
    outputSource:
      - picard_mark_duplicates_2_8_1/bam
    type: File
    'sbg:x': 1923.065673828125
    'sbg:y': 460.8460998535156
steps:
  - id: trim_galore_0_6_2
    in:
      - id: fastq1
        source: fastq1
      - id: fastq2
        source: fastq2
      - id: paired
        default: false
        source: paired
      - id: gzip
        default: false
        source: gzip
    out:
      - id: clfastq1
      - id: clfastq2
      - id: clstats1
      - id: clstats2
    run: command_line_tools/trim_galore_0.6.2/trim_galore_0.6.2.cwl
    label: trim_galore_0.6.2
    'sbg:x': 322.29840087890625
    'sbg:y': 958.069091796875
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
    'sbg:x': 987.0015869140625
    'sbg:y': 809.6751708984375
  - id: calculate_apply_bqsr_cwl
    in:
      - id: known_sites_1
        source: known_sites_1
      - id: input
        source: abra_fx_cwl/bam
      - id: known_sites_2
        source: known_sites_2
      - id: reference
        source: reference
    out:
      - id: output
    run: subworkflows/calculate_apply_bqsr-cwl.cwl
    label: calculate_apply_bqsr.cwl
    'sbg:x': 1832.4149169921875
    'sbg:y': 951.3013305664062
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
    out:
      - id: bam
    run: subworkflows/abra_fx-cwl.cwl
    label: abra_fx.cwl
    'sbg:x': 1289.94384765625
    'sbg:y': 992.5078125
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
    out:
      - id: bam
    run: subworkflows/alignment.cwl
    label: alignment
    'sbg:x': 523.8980712890625
    'sbg:y': 1333.4296875
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
