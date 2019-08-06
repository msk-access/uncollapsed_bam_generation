class: Workflow
cwlVersion: v1.0
id: abra_fx_cwl
label: abra_fx.cwl
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: input_bam
    type:
      - File
      - type: array
        items: File
    secondaryFiles:
      - ^.bai
    'sbg:x': -1193.5728759765625
    'sbg:y': 221.94479370117188
  - id: reference_fasta
    type: File
    secondaryFiles:
      - .fai
      - ^.dict
    'sbg:x': -1170.9459228515625
    'sbg:y': -175.96751403808594
  - id: option_bedgraph
    type: boolean?
    'sbg:exposed': true
  - id: bam_index
    type: boolean?
    'sbg:exposed': true
outputs:
  - id: bam
    outputSource:
      - picard_fix_mate_information_1_96/bam
    type: File
    secondaryFiles:
      - ^.bai
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
  - id: bedtools_merge
    in:
      - id: input
        source: bedtools_genomecov/output_file
    out:
      - id: output_file
    run: >-
      ../command_line_tools/bedtools_merge_v2.28.0_cv2/bedtools_merge_v2.28.0_cv2.cwl
    label: bedtools_merge
    'sbg:x': -544
    'sbg:y': -354
  - id: abra2_2_17
    in:
      - id: input_bam
        source:
          - input_bam
      - id: reference_fasta
        source: reference_fasta
      - id: targets
        source: bedtools_merge/output_file
      - id: bam_index
        source: bam_index
    out:
      - id: realigned_bam
    run: ../command_line_tools/abra2_2.17/abra2_2.17.cwl
    label: abra2_2.17
    'sbg:x': -345.47686767578125
    'sbg:y': -45.99028015136719
  - id: bedtools_genomecov
    in:
      - id: input
        source: input_bam
      - id: option_bedgraph
        source: option_bedgraph
    out:
      - id: output_file
    run: >-
      ../command_line_tools/bedtools_genomecov_v2.28.0_cv2/bedtools_genomecov_v2.28.0_cv2.cwl
    label: bedtools_genomecov
    'sbg:x': -804.4765625
    'sbg:y': -225.5
requirements: []
