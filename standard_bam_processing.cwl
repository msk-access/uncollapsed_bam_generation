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
    'sbg:y': 1707.6328125
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
    'sbg:y': 213.4453125
  - id: known_sites_1
    type: File
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 1494.1796875
  - id: known_sites_2
    type: File?
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 1387.4609375
  - id: bam_compression_level
    type: int?
    'sbg:x': 523.88232421875
    'sbg:y': 1043.609375
  - id: paired
    type: boolean
    'sbg:x': 0
    'sbg:y': 960.5703125
  - id: gzip
    type: boolean
    'sbg:x': 0
    'sbg:y': 1600.90625
  - id: validation_stringency
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: duplicate_scoring_strategy
    type: string?
    'sbg:x': 523.88232421875
    'sbg:y': 616.7265625
  - id: create_bam_index
    type: boolean?
    'sbg:x': 523.88232421875
    'sbg:y': 723.453125
  - id: assume_sorted
    type: boolean?
    'sbg:x': 523.88232421875
    'sbg:y': 1150.328125
  - id: bam_index
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2027.7890625
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1174.015625
  - id: fastq1
    type: File
    'sbg:x': 0
    'sbg:y': 1814.3515625
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 320.171875
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 426.90625
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 533.640625
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 640.375
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 747.109375
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 853.84375
  - id: P
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1067.2890625
  - id: M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1280.7421875
  - id: create_bam_index_1
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1921.0703125
  - id: sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 106.7265625
outputs:
  - id: clstats2
    outputSource:
      - trim_galore_0_6_2/clstats2
    type: File
    'sbg:x': 523.88232421875
    'sbg:y': 830.171875
  - id: clstats1
    outputSource:
      - trim_galore_0_6_2/clstats1
    type: File
    'sbg:x': 523.88232421875
    'sbg:y': 936.890625
  - id: output
    outputSource:
      - calculate_apply_bqsr_cwl/output
      - picard_mark_duplicates_2_8_1/bam
      - trim_galore_0_6_2/clstats2
      - trim_galore_0_6_2/clstats1
    type: 'File[]?'
    'sbg:x': 1883.3990478515625
    'sbg:y': 377.5904235839844
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
    'sbg:y': 992.890625
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
    'sbg:x': 965.10009765625
    'sbg:y': 978.8984375
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
    'sbg:x': 1534.783447265625
    'sbg:y': 992.890625
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
    'sbg:x': 1289.92822265625
    'sbg:y': 992.8984375
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
    'sbg:x': 523.88232421875
    'sbg:y': 1334.0546875
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
