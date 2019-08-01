class: Workflow
cwlVersion: v1.0
id: standard_bam_processing_cwl
label: standard_bam_processing.cwl
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: fastq2
    type: File
    'sbg:x': -638.232421875
    'sbg:y': -288.46490478515625
  - id: fastq1
    type: File
    'sbg:x': -629.4970092773438
    'sbg:y': -43.10979080200195
  - id: reference
    type: File
    'sbg:x': -579.896240234375
    'sbg:y': 164.53863525390625
  - id: known_sites_1
    type: File
    'sbg:x': -567.4667358398438
    'sbg:y': 355.0628356933594
  - id: M
    type: boolean?
    'sbg:exposed': true
  - id: P
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
  - id: read_group_sequencing_platform
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
  - id: sort_order
    type: string?
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
  - id: optical_duplicate_pixel_distance
    type: int?
    'sbg:exposed': true
outputs:
  - id: clstats2
    outputSource:
      - trim_galore_0_6_2/clstats2
    type: File
    'sbg:x': -226.53366088867188
    'sbg:y': -384.7630920410156
  - id: clstats1
    outputSource:
      - trim_galore_0_6_2/clstats1
    type: File
    'sbg:x': -224.69078063964844
    'sbg:y': -239.06234741210938
  - id: output
    outputSource:
      - calculate_apply_bqsr_cwl/output
    type: File?
    'sbg:x': 620.751708984375
    'sbg:y': 326.4988708496094
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
    'sbg:x': -449
    'sbg:y': -112
  - id: bwa_mem_0_7_5a
    in:
      - id: M
        source: M
      - id: P
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
    'sbg:x': -236
    'sbg:y': -48
  - id: picard_add_or_replace_read_groups_1_96
    in:
      - id: input
        source: bwa_mem_0_7_5a/sam
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
    out:
      - id: bam
    run: >-
      command_line_tools/picard_add_or_replace_read_groups_1.96/picard_add_or_replace_read_groups_1.96.cwl
    label: picard_add_or_replace_read_groups_1.96
    'sbg:x': 15.287079811096191
    'sbg:y': -99.61151885986328
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
      - id: sort_order
        source: sort_order
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
      - id: optical_duplicate_pixel_distance
        source: optical_duplicate_pixel_distance
    out:
      - id: bam
    run: >-
      command_line_tools/picard_mark_duplicates_2.8.1/picard_mark_duplicates_2.8.1.cwl
    label: picard_mark_duplicates_2.8.1
    'sbg:x': 255.9733123779297
    'sbg:y': -141.24972534179688
  - id: abra_fx_cwl
    in:
      - id: reference_fasta
        source: reference
      - id: input_bam
        source:
          - picard_mark_duplicates_2_8_1/bam
    out:
      - id: bam
    run: subworkflows/abra_fx-cwl.cwl
    label: abra_fx.cwl
    'sbg:x': 326.5209655761719
    'sbg:y': 124.83001708984375
  - id: calculate_apply_bqsr_cwl
    in:
      - id: reference
        source: reference
      - id: known_sites_1
        source: known_sites_1
      - id: input
        source: abra_fx_cwl/bam
    out:
      - id: output
    run: subworkflows/calculate_apply_bqsr-cwl.cwl
    label: calculate_apply_bqsr.cwl
    'sbg:x': 416.6186828613281
    'sbg:y': 326.2715148925781
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
