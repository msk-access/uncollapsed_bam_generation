class: Workflow
cwlVersion: v1.0
id: alignment
label: alignment
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reference
    type: File
    secondaryFiles:
      - .fai
      - ^.dict
    'sbg:x': 0
    'sbg:y': 106.890625
  - id: reads
    type: 'File[]'
    'sbg:x': 0
    'sbg:y': 213.78125
  - id: P
    type: boolean?
    'sbg:x': -21.404436111450195
    'sbg:y': 978.0689697265625
  - id: M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1068.90625
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 855.125
  - id: sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: create_bam_index
    type: boolean?
    'sbg:x': 319.15625
    'sbg:y': 460.0078125
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 320.671875
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 427.5625
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 534.453125
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 641.34375
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 748.234375
outputs:
  - id: bam
    outputSource:
      - picard_add_or_replace_read_groups_1_96/bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 1205.1102294921875
    'sbg:y': 353.8021240234375
steps:
  - id: bwa_mem_0_7_5a
    in:
      - id: M
        source: M
      - id: P
        source: P
      - id: reads
        source:
          - reads
      - id: reference
        source: reference
    out:
      - id: sam
    run: command_line_tools/bwa_mem_0.7.5a/bwa_mem_0.7.5a.cwl
    label: bwa-mem
    'sbg:x': 608.1161499023438
    'sbg:y': 809.969482421875
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
        source: create_bam_index
    out:
      - id: bam
    run: >-
      command_line_tools/picard_add_or_replace_read_groups_1.96/picard_add_or_replace_read_groups_1.96.cwl
    label: picard_add_or_replace_read_groups_1.96
    'sbg:x': 783.4304809570312
    'sbg:y': 241.6665496826172
requirements: []
