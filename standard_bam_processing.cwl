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
    'sbg:y': 1600.40625
  - id: fastq1
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
    'sbg:y': 106.6875
  - id: known_sites_1
    type: File
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 1387.03125
  - id: known_sites_2
    type: File?
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 1280.390625
  - id: bam_compression_level
    type: int?
    'sbg:x': 740.8355712890625
    'sbg:y': 1173.609375
  - id: paired
    type: boolean
    'sbg:x': 0
    'sbg:y': 853.734375
  - id: gzip
    type: boolean
    'sbg:x': 0
    'sbg:y': 1493.71875
  - id: P
    type: boolean?
    'sbg:x': 0
    'sbg:y': 960.375
  - id: M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1173.75
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 213.375
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 320.109375
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 426.84375
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 533.578125
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 640.3125
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 747.046875
  - id: create_bam_index_1
    type: boolean?
    'sbg:x': 910.4716796875
    'sbg:y': 394.5094299316406
  - id: validation_stringency
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: number_of_threads
    type: int?
    'sbg:x': 740.8355712890625
    'sbg:y': 640.125
  - id: memory_per_job
    type: int?
    'sbg:x': 740.8355712890625
    'sbg:y': 746.8125
  - id: memory_overhead
    type: int?
    'sbg:x': 740.8355712890625
    'sbg:y': 853.546875
  - id: duplicate_scoring_strategy
    type: string?
    'sbg:x': 740.8355712890625
    'sbg:y': 960.28125
  - id: create_bam_index
    type: boolean?
    'sbg:x': 740.8355712890625
    'sbg:y': 1066.96875
  - id: assume_sorted
    type: boolean?
    'sbg:x': 740.8355712890625
    'sbg:y': 1280.25
  - id: bam_index
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1813.6875
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1067.0625
  - id: sort_order
    type: string?
    'sbg:x': 1238.203857421875
    'sbg:y': -810.7881469726562
outputs:
  - id: clstats2
    outputSource:
      - trim_galore_0_6_2/clstats2
    type: File
    'sbg:x': 523.8824462890625
    'sbg:y': 832.546875
  - id: clstats1
    outputSource:
      - trim_galore_0_6_2/clstats1
    type: File
    'sbg:x': 523.8824462890625
    'sbg:y': 939.1875
  - id: output
    outputSource:
      - calculate_apply_bqsr_cwl/output
      - picard_mark_duplicates_2_8_1/bam
    type: 'File[]?'
    'sbg:x': 1981.063720703125
    'sbg:y': 906.8671875
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
    'sbg:y': 885.8203125
  - id: bwa_mem_0_7_5a
    in:
      - id: M
        source: M
      - id: P
        default: false
        source: P
      - id: reads
        source:
          - trim_galore_0_6_2/clfastq1
          - trim_galore_0_6_2/clfastq2
      - id: reference
        source: reference
    out:
      - id: sam
    run: command_line_tools/bwa_mem_0.7.5a/bwa_mem_0.7.5a.cwl
    label: bwa-mem
    'sbg:x': 523.8824462890625
    'sbg:y': 1066.828125
  - id: picard_add_or_replace_read_groups_1_96
    in:
      - id: input
        source: bwa_mem_0_7_5a/sam
      - id: sort_order
        source: sort_order
      - id: read_group_identifier
        source: read_group_identifier
      - id: read_group_sequnecing_center
        source: read_group_sequnecing_center
      - id: read_group_library
        source: read_group_library
      - id: read_group_platform_unit
        source: read_group_platform_unit
      - id: read_group_sample_name
        source: read_group_sample_name
      - id: read_group_sequencing_platform
        source: read_group_sequencing_platform
      - id: create_bam_index
        source: create_bam_index_1
    out:
      - id: bam
    run: >-
      command_line_tools/picard_add_or_replace_read_groups_1.96/picard_add_or_replace_read_groups_1.96.cwl
    label: picard_add_or_replace_read_groups_1.96
    'sbg:x': 1653.717041015625
    'sbg:y': 117.58490753173828
  - id: picard_mark_duplicates_2_8_1
    in:
      - id: memory_per_job
        source: memory_per_job
      - id: memory_overhead
        source: memory_overhead
      - id: number_of_threads
        source: number_of_threads
      - id: input
        source: picard_add_or_replace_read_groups_1_96/bam
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
    'sbg:x': 1750.21337890625
    'sbg:y': 1567.026123046875
  - id: calculate_apply_bqsr_cwl
    in:
      - id: reference
        source: reference
      - id: known_sites_1
        source: known_sites_1
      - id: input
        source: abra_fx_cwl/bam
      - id: known_sites_2
        source: known_sites_2
    out:
      - id: output
    run: subworkflows/calculate_apply_bqsr-cwl.cwl
    label: calculate_apply_bqsr.cwl
    'sbg:x': 1736.88037109375
    'sbg:y': 885.8203125
  - id: abra_fx_cwl
    in:
      - id: input_bam
        source:
          - picard_mark_duplicates_2_8_1/bam
      - id: reference_fasta
        source: reference
      - id: option_bedgraph
        source: option_bedgraph
      - id: bam_index
        source: bam_index
    out:
      - id: bam
    run: subworkflows/abra_fx-cwl.cwl
    label: abra_fx.cwl
    'sbg:x': 1492.025146484375
    'sbg:y': 885.8671875
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
