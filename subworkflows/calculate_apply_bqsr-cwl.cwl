class: Workflow
cwlVersion: v1.0
id: calculate_apply_bqsr_cwl
label: calculate_apply_bqsr.cwl
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reference
    type: File
    secondaryFiles:
      - .fai
      - ^.dict
    'sbg:x': -529.8873901367188
    'sbg:y': -374.4850158691406
  - id: known_sites_1
    type: File
    secondaryFiles:
      - .idx
    'sbg:x': -612.3988647460938
    'sbg:y': -17
  - id: input
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': -577.3988647460938
    'sbg:y': 145
  - id: known_sites_2
    type: File?
    secondaryFiles:
      - .idx
    'sbg:x': -802
    'sbg:y': -112
outputs:
  - id: output
    outputSource:
      - gatk_apply_bqsr_4_1_2_0/output
    type: File?
    secondaryFiles:
      - ^.bai
    'sbg:x': 399.60113525390625
    'sbg:y': -43
steps:
  - id: gatk_base_recalibrator_4_1_2_0
    in:
      - id: input
        source: input
      - id: known_sites_1
        source: known_sites_1
      - id: reference
        source: reference
      - id: known_sites_2
        source: known_sites_2
    out:
      - id: output
    run: >-
      ../command_line_tools/gatk_BaseRecalibrator_4.1.2.0/gatk_baserecalibrator_4.1.2.0.cwl
    label: gatk_base_recalibrator_4.1.2.0
    'sbg:x': -187
    'sbg:y': -239
  - id: gatk_apply_bqsr_4_1_2_0
    in:
      - id: reference
        source: reference
      - id: bqsr_recal_file
        source: gatk_base_recalibrator_4_1_2_0/output
      - id: input
        source: input
    out:
      - id: output
    run: ../command_line_tools/gatk_ApplyBQSR_4.1.2.0/gatk_ApplyBQSR_4.1.2.0.cwl
    label: gatk_apply_bqsr_4.1.2.0
    'sbg:x': 54
    'sbg:y': -42
requirements: []
