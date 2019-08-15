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
    'sbg:y': 1601.1484375
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
    'sbg:x': 23.071672439575195
    'sbg:y': 122.1501693725586
  - id: known_sites_1
    type: File
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 1387.6640625
  - id: known_sites_2
    type: File?
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 1280.9296875
  - id: bam_compression_level
    type: int?
    'sbg:x': 523.8824462890625
    'sbg:y': 1157.53125
  - id: paired
    type: boolean
    'sbg:x': -249.77468872070312
    'sbg:y': 938.44921875
  - id: gzip
    type: boolean
    'sbg:x': 0
    'sbg:y': 1494.40625
  - id: validation_stringency
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: duplicate_scoring_strategy
    type: string?
    'sbg:x': 523.8824462890625
    'sbg:y': 730.5859375
  - id: create_bam_index
    type: boolean?
    'sbg:x': 523.8824462890625
    'sbg:y': 837.328125
  - id: assume_sorted
    type: boolean?
    'sbg:x': 523.8824462890625
    'sbg:y': 1264.265625
  - id: bam_index
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1921.3515625
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1067.453125
  - id: fastq1
    type: File
    'sbg:x': 0
    'sbg:y': 1707.8828125
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 213.484375
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 320.234375
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 426.984375
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 533.734375
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 640.484375
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 747.234375
  - id: P
    type: boolean?
    'sbg:x': 0
    'sbg:y': 960.7109375
  - id: M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1174.1953125
  - id: create_bam_index_1
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1814.6171875
  - id: sort_order
    type: string?
    'sbg:x': 211.4326934814453
    'sbg:y': -134.37013244628906
outputs:
  - id: clstats2
    outputSource:
      - trim_galore_0_6_2/clstats2
    type: File
    'sbg:x': 523.8824462890625
    'sbg:y': 944.0625
  - id: clstats1
    outputSource:
      - trim_galore_0_6_2/clstats1
    type: File
    'sbg:x': 523.8824462890625
    'sbg:y': 1050.796875
  - id: output
    outputSource:
      - calculate_apply_bqsr_cwl/output
      - picard_mark_duplicates_2_8_1/bam
    type: 'File[]?'
    'sbg:x': 1801.048583984375
    'sbg:y': 960.6796875
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
    'sbg:x': 506.3310241699219
    'sbg:y': 472.3157043457031
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
    'sbg:x': 2328.3779296875
    'sbg:y': 2168.15283203125
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
    'sbg:x': 1775.5426025390625
    'sbg:y': -314.498291015625
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
    'sbg:x': 1330.2593994140625
    'sbg:y': 892.6348266601562
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
    'sbg:x': 3339.23583984375
    'sbg:y': 460.068359375
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
