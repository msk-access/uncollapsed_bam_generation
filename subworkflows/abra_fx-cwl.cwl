class: Workflow
cwlVersion: v1.0
id: abra_fx_cwl
label: abra_fx.cwl
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: targets
    type: File
    'sbg:x': -558
    'sbg:y': -159
  - id: reference_fasta
    type: File
    'sbg:x': -724.3987426757812
    'sbg:y': 5
  - id: input_bam
    type:
      - File
      - type: array
        items: File
    'sbg:x': -548
    'sbg:y': 177
outputs:
  - id: bam
    outputSource:
      - picard_fix_mate_information_1_96/bam
    type: File
    'sbg:x': 80
    'sbg:y': -24
steps:
  - id: picard_fix_mate_information_1_96
    in:
      - id: input
        source: abra2_2_17/realigned_bam
    out:
      - id: bam
    run: >-
      ../command_line_tools/picard_fix_mate_information_1.96/picard_fix_mate_information_1.96.cwl
    label: picard_fix_mate_information_1.96
    'sbg:x': -115
    'sbg:y': -10
  - id: abra2_2_17
    in:
      - id: input_bam
        source:
          - input_bam
      - id: reference_fasta
        source: reference_fasta
      - id: targets
        source: targets
    out:
      - id: realigned_bam
    run: ../command_line_tools/abra2_2.17/abra2_2.17.cwl
    label: abra2_2.17
    'sbg:x': -373.39886474609375
    'sbg:y': 3
requirements: []
