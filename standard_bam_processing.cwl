class: Workflow
cwlVersion: v1.0
id: fastq_to_bam_cwl
label: fastq_to_bam.cwl
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: fastq2
    type: File
    'sbg:x': -899.7838745117188
    'sbg:y': -341.1614990234375
  - id: fastq1
    type: File
    'sbg:x': -894
    'sbg:y': -189
  - id: reference
    type: File
    'sbg:x': -910
    'sbg:y': -480
  - id: gzip
    type: boolean
    'sbg:exposed': true
  - id: read_group_library
    type: int
    'sbg:exposed': true
  - id: memory_per_job
    type: int
    'sbg:exposed': true
outputs:
  - id: clstats1
    outputSource:
      - trim_galore_0_6_2/clstats1
    type: File
    'sbg:x': -230.8515625
    'sbg:y': -326
  - id: clstats2
    outputSource:
      - trim_galore_0_6_2/clstats2
    type: File
    'sbg:x': -260.8515625
    'sbg:y': -468.2755126953125
  - id: bam
    outputSource:
      - picard_add_or_replace_read_groups_1_96/bam
    type: File
    'sbg:x': 246.153076171875
    'sbg:y': -351.2760009765625
steps:
  - id: trim_galore_0_6_2
    in:
      - id: memory_per_job
        source: memory_per_job
      - id: fastq1
        linkMerge: merge_nested
        source: fastq1
      - id: fastq2
        source: fastq2
      - id: paired
        default: true
      - id: gzip
        default: false
        source: gzip
    out:
      - id: clfastq1
      - id: clfastq2
      - id: clstats1
      - id: clstats2
    run: cwl-commandlinetools/trim_galore_0.6.2/trim_galore_0.6.2.cwl
    label: trim_galore_0.6.2
    'sbg:x': -556
    'sbg:y': -83
  - id: bwa_mem_0_7_5a
    in:
      - id: reads
        source:
          - trim_galore_0_6_2/clfastq1
          - trim_galore_0_6_2/clfastq2
      - id: reference
        source: reference
    out:
      - id: sam
    run: cwl-commandlinetools/bwa_mem_0.7.5a/bwa_mem_0.7.5a.cwl
    label: bwa-mem
    'sbg:x': -162.39886474609375
    'sbg:y': -107
  - id: picard_add_or_replace_read_groups_1_96
    in:
      - id: input
        source: bwa_mem_0_7_5a/sam
      - id: read_group_library
        source: read_group_library
    out:
      - id: bam
    run: >-
      cwl-commandlinetools/picard_add_or_replace_read_groups_1.96/picard_add_or_replace_read_groups_1.96.cwl
    label: picard_add_or_replace_read_groups_1.96
    'sbg:x': 127
    'sbg:y': -189
requirements:
  - class: MultipleInputFeatureRequirement
