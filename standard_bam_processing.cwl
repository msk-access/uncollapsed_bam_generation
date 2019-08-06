class: Workflow
cwlVersion: v1.0
id: standard_bam_processing_cwl
label: standard_bam_processing.cwl
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: fastq2
    type: File
    'sbg:x': -189.7229461669922
    'sbg:y': 264.0501403808594
  - id: fastq1
    type: File
    'sbg:x': -139.38040161132812
    'sbg:y': 509.3804016113281
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
    'sbg:x': -79.02245330810547
    'sbg:y': -302.34814453125
  - id: M
    type: boolean?
    'sbg:exposed': true
  - id: paired
    type: boolean
    'sbg:exposed': true
  - id: gzip
    type: boolean
    'sbg:exposed': true
  - id: read_group_identifier
    type: string
    'sbg:exposed': true
  - id: read_group_sequnecing_center
    type: string
    'sbg:exposed': true
  - id: read_group_library
    type: int
    'sbg:exposed': true
  - id: read_group_platform_unit
    type: string
    'sbg:exposed': true
  - id: read_group_sample_name
    type: string
    'sbg:exposed': true
  - id: memory_per_job
    type: int?
    'sbg:exposed': true
  - id: memory_overhead
    type: int?
    'sbg:exposed': true
  - id: number_of_threads
    type: int?
    'sbg:exposed': true
  - id: validation_stringency
    type: string?
    'sbg:exposed': true
  - id: bam_compression_level
    type: int?
    'sbg:exposed': true
  - id: create_bam_index
    type: boolean?
    'sbg:exposed': true
  - id: assume_sorted
    type: boolean?
    'sbg:exposed': true
  - id: duplicate_scoring_strategy
    type: string?
    'sbg:exposed': true
  - id: P
    type: boolean?
    'sbg:exposed': true
  - id: read_group_sequencing_platform
    type: string
    'sbg:exposed': true
  - id: known_sites_1
    type: File
    secondaryFiles:
      - .idx
    'sbg:x': -290.86785888671875
    'sbg:y': -31.705486297607422
  - id: known_sites_2
    type: File?
    secondaryFiles:
      - .idx
    'sbg:x': -277.68792724609375
    'sbg:y': 137.75094604492188
  - id: sort_order
    type: string?
    'sbg:exposed': true
  - id: option_bedgraph
    type: boolean?
    'sbg:exposed': true
  - id: create_bam_index_1
    type: boolean?
    'sbg:exposed': true
  - id: bam_index
    type: boolean?
    'sbg:exposed': true
outputs:
  - id: clstats2
    outputSource:
      - trim_galore_0_6_2/clstats2
    type: File
    'sbg:x': 369.08056640625
    'sbg:y': 46.4453125
  - id: clstats1
    outputSource:
      - trim_galore_0_6_2/clstats1
    type: File
    'sbg:x': 369.08056640625
    'sbg:y': 153.3359375
  - id: output
    outputSource:
      - calculate_apply_bqsr_cwl/output
      - picard_mark_duplicates_2_8_1/bam
    type: 'File[]?'
    'sbg:x': 1576.23681640625
    'sbg:y': -24.9184513092041
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
    'sbg:x': 60.10823059082031
    'sbg:y': 428.3694152832031
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
    'sbg:x': 447.61474609375
    'sbg:y': 499
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
    'sbg:x': 441.2775573730469
    'sbg:y': 278.8172607421875
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
    'sbg:x': 794.15576171875
    'sbg:y': 378.57080078125
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
    'sbg:x': 1528.6962890625
    'sbg:y': 391.689453125
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
    'sbg:x': 824.81494140625
    'sbg:y': -299.37060546875
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
