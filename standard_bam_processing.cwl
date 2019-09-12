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
    'sbg:y': 1920.921875
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
    'sbg:y': 213.421875
  - id: known_sites_1
    type: File
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 1707.484375
  - id: known_sites_2
    type: File?
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 1600.78125
  - id: bam_compression_level
    type: int?
    'sbg:x': 523.8824462890625
    'sbg:y': 1136.2578125
  - id: paired
    type: boolean
    'sbg:x': 0
    'sbg:y': 960.53125
  - id: gzip
    type: boolean
    'sbg:x': 0
    'sbg:y': 1814.203125
  - id: validation_stringency
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: duplicate_scoring_strategy
    type: string?
    'sbg:x': 523.8824462890625
    'sbg:y': 709.3984375
  - id: create_bam_index
    type: boolean?
    label: picard_md_create_bam_index_flag
    'sbg:x': 523.8824462890625
    'sbg:y': 816.1328125
  - id: assume_sorted
    type: boolean?
    'sbg:x': 523.8824462890625
    'sbg:y': 1242.9609375
  - id: bam_index
    type: boolean?
    label: abra_bam_index_flag
    'sbg:x': 0
    'sbg:y': 2241.078125
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1387.359375
  - id: fastq1
    type: File
    'sbg:x': 0
    'sbg:y': 2027.625
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 320.140625
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 426.875
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 533.609375
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 640.34375
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 747.078125
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 853.8125
  - id: P
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1067.234375
  - id: M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1494.078125
  - id: create_bam_index_1
    type: boolean?
    label: picard_addrg_bam_index_flag
    'sbg:x': 0
    'sbg:y': 2134.34375
  - id: sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 106.71875
  - id: output
    type: string?
    label: aln_output_file_name
    'sbg:x': 0
    'sbg:y': 1280.640625
  - id: output_file_name
    type: string?
    label: picard_output_file_name
    'sbg:x': 0
    'sbg:y': 1173.9375
outputs:
  - id: clstats2
    outputSource:
      - trim_galore_0_6_2/clstats2
    type: File
    'sbg:x': 523.8824462890625
    'sbg:y': 922.8515625
  - id: clstats1
    outputSource:
      - trim_galore_0_6_2/clstats1
    type: File
    'sbg:x': 523.8824462890625
    'sbg:y': 1029.5546875
  - id: bqsr_bam
    outputSource:
      - calculate_apply_bqsr_cwl/output
    type: File?
    secondaryFiles:
      - ^.bai
    'sbg:x': 1800.99951171875
    'sbg:y': 1120.5546875
  - id: md_bam
    outputSource:
      - picard_mark_duplicates_2_8_1/bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 1311.9609375
    'sbg:y': 1046.203125
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
    'sbg:x': 319.15625
    'sbg:y': 1099.5390625
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
    'sbg:x': 987.1328735351562
    'sbg:y': 1085.5546875
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
    'sbg:x': 1556.816162109375
    'sbg:y': 1099.5390625
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
    'sbg:x': 1311.9609375
    'sbg:y': 1173.90625
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
    'sbg:x': 523.8824462890625
    'sbg:y': 1440.6796875
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
