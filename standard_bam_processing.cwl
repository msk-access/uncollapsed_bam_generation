class: Workflow
cwlVersion: v1.0
id: standard_bam_processing_cwl
doc: >-
  This is the workflow is written using Common Workflow Language (CWL) version
  1.0 (https://www.commonwl.org/v1.0/) and is used at Memorial Sloan Kettering
  Cancer Center for producing standard bam files from the NY state-approved
  MSK-ACCESS assay. It is meant to be run on a single sample paired-end read 1
  and read 2 fastq's, from Illumina sequencing data, but may be generalizable to
  other sequencing platforms and sequencing panels as well, which produce
  paired-end data.
label: Standard BAM Generation
$namespaces:
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: fastq2
    type: File
    'sbg:x': 0
    'sbg:y': 2989.4375
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
    'sbg:y': 747.359375
  - id: known_sites_1
    type: File
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 2775.90625
  - id: known_sites_2
    type: File?
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 2669.140625
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2028.546875
  - id: fastq1
    type: File
    'sbg:x': 0
    'sbg:y': 3096.203125
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 854.125
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 960.890625
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 1067.65625
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 1174.421875
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 1281.1875
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 1387.953125
  - id: P
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1708.25
  - id: output
    type: string?
    label: aln_output_file_name
    'sbg:x': 0
    'sbg:y': 1921.78125
  - id: output_file_name
    type: string?
    label: picard_output_file_name
    'sbg:x': 0
    'sbg:y': 1815.015625
  - id: window_size
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: soft_clip_contig
    type: string?
    'sbg:x': 0
    'sbg:y': 533.828125
  - id: scoring_gap_alignments
    type: string?
    'sbg:x': 0
    'sbg:y': 640.59375
  - id: maximum_mixmatch_rate
    type: float?
    'sbg:x': 0
    'sbg:y': 2242.078125
  - id: maximum_average_depth
    type: int?
    'sbg:x': 0
    'sbg:y': 2348.84375
  - id: ignore_bad_assembly
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2882.671875
  - id: contig_anchor
    type: string?
    'sbg:x': 0
    'sbg:y': 3202.96875
  - id: consensus_sequence
    type: boolean?
    'sbg:x': 0
    'sbg:y': 3309.734375
  - id: stringency
    type: int?
    label: trim_galore_stringency
    'sbg:x': 0
    'sbg:y': 320.296875
  - id: quality
    type: int?
    label: trim_galore_quality
    'sbg:x': 0
    'sbg:y': 1601.484375
  - id: length
    type: int?
    label: trim_galore_length
    'sbg:x': 0
    'sbg:y': 2562.375
  - id: adapter2
    type: string?
    'sbg:x': 0
    'sbg:y': 3416.5
  - id: adapter
    type: string?
    'sbg:x': 0
    'sbg:y': 3523.265625
  - id: number_of_threads
    type: int?
    label: abra_number_of_threads
    'sbg:x': 0
    'sbg:y': 2135.3125
  - id: validation_stringency
    type: string?
    'sbg:x': 0
    'sbg:y': 106.765625
  - id: create_bam_index
    type: boolean?
    'sbg:x': 643.3338623046875
    'sbg:y': 1677.6328125
  - id: assume_sorted
    type: boolean?
    'sbg:x': 643.3338623046875
    'sbg:y': 1784.3984375
  - id: M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2455.609375
  - id: sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 427.0625
  - id: trim_galore_number_of_threads
    type: int?
    'sbg:x': 0
    'sbg:y': 213.53125
  - id: read_filter
    type:
      - 'null'
      - type: array
        items: string
        inputBinding:
          prefix: '--read-filter'
    'sbg:x': 0
    'sbg:y': 1494.71875
  - id: clstats2_rename
    type: string?
    'sbg:x': 319.15625
    'sbg:y': 1761.6328125
  - id: clstat1_rename
    type: string?
    'sbg:x': 319.15625
    'sbg:y': 1868.3984375
outputs:
  - id: bqsr_bam
    outputSource:
      - calculate_apply_bqsr/bqsr_bam
    type: File?
    secondaryFiles:
      - ^.bai
    'sbg:x': 2133.903076171875
    'sbg:y': 1815.015625
  - id: md_bam
    outputSource:
      - picard_mark_duplicates_2_8_1/bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 1359.8614501953125
    'sbg:y': 1624.25
  - id: output_file
    outputSource:
      - abra_fx/output_file
    type: File?
    label: indel_realign_targets
    'sbg:x': 1854.496826171875
    'sbg:y': 1680.25
  - id: standard_bam_alignment_metrics
    outputSource:
      - picard_collect_alignment_summary_metrics_2_8_1/alignment_metrics
    type: File
    'sbg:x': 2439.8984375
    'sbg:y': 1761.6328125
  - id: clstat2
    outputSource:
      - mv/out
    type: File
    'sbg:x': 1106.5843505859375
    'sbg:y': 1761.6328125
  - id: clstat1
    outputSource:
      - mv_1/out
    type: File
    'sbg:x': 1106.5843505859375
    'sbg:y': 1868.3984375
steps:
  - id: trim_galore_0_6_2
    in:
      - id: number_of_threads
        source: trim_galore_number_of_threads
      - id: adapter
        source: adapter
      - id: adapter2
        source: adapter2
      - id: fastq1
        source: fastq1
      - id: fastq2
        source: fastq2
      - id: length
        source: length
      - id: paired
        default: true
      - id: gzip
        default: true
      - id: quality
        source: quality
      - id: stringency
        source: stringency
      - id: suppress_warn
        default: true
    out:
      - id: clfastq1
      - id: clfastq2
      - id: clstats1
      - id: clstats2
    run: command_line_tools/trim_galore_0.6.2/trim_galore_0.6.2.cwl
    label: trim_galore_0.6.2
    'sbg:x': 319.15625
    'sbg:y': 1605.8671875
  - id: picard_mark_duplicates_2_8_1
    in:
      - id: input
        source: alignment/bam
      - id: validation_stringency
        default: LENIENT
        source: validation_stringency
      - id: create_bam_index
        default: true
        source: create_bam_index
      - id: assume_sorted
        default: true
        source: assume_sorted
    out:
      - id: bam
    run: >-
      command_line_tools/picard_mark_duplicates_2.8.1/picard_mark_duplicates_2.8.1.cwl
    label: picard_mark_duplicates_2.8.1
    'sbg:x': 1106.5843505859375
    'sbg:y': 1633.8671875
  - id: calculate_apply_bqsr
    in:
      - id: known_sites_1
        source: known_sites_1
      - id: input
        source: abra_fx/abra_fx_bam
      - id: known_sites_2
        source: known_sites_2
      - id: reference
        source: reference
      - id: read_filter
        source:
          - read_filter
    out:
      - id: bqsr_bam
    run: subworkflows/calculate_apply_bqsr.cwl
    label: calculate_apply_bqsr.cwl
    'sbg:x': 1854.496826171875
    'sbg:y': 1815.015625
  - id: abra_fx
    in:
      - id: input_bam
        source:
          - picard_mark_duplicates_2_8_1/bam
      - id: reference_fasta
        source: reference
      - id: bam_index
        source: create_bam_index
      - id: option_bedgraph
        source: option_bedgraph
      - id: window_size
        source: window_size
      - id: soft_clip_contig
        source: soft_clip_contig
      - id: scoring_gap_alignments
        source: scoring_gap_alignments
      - id: maximum_mixmatch_rate
        source: maximum_mixmatch_rate
      - id: maximum_average_depth
        source: maximum_average_depth
      - id: ignore_bad_assembly
        source: ignore_bad_assembly
      - id: contig_anchor
        source: contig_anchor
      - id: consensus_sequence
        source: consensus_sequence
      - id: number_of_threads
        source: number_of_threads
    out:
      - id: abra_fx_bam
      - id: output_file
    run: subworkflows/abra_fx.cwl
    label: abra_fx.cwl
    'sbg:x': 1359.8614501953125
    'sbg:y': 1815.015625
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
        default: true
        source: M
      - id: read_group_identifier
        source: read_group_identifier
      - id: sort_order
        default: coordinate
        source: sort_order
      - id: create_bam_index
        default: true
        source: create_bam_index
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
      - id: output_file_name
        source: output_file_name
      - id: output
        source: output
    out:
      - id: bam
    run: subworkflows/alignment.cwl
    label: alignment
    'sbg:x': 643.3338623046875
    'sbg:y': 1982.1640625
  - id: picard_collect_alignment_summary_metrics_2_8_1
    in:
      - id: input
        source: calculate_apply_bqsr/bqsr_bam
      - id: reference_sequence
        source: reference
    out:
      - id: alignment_metrics
    run: >-
      command_line_tools/picard_collect_alignment_summary_metrics_2.8.1/picard_collect_alignment_summary_metrics_2.8.1.cwl
    label: picard_collect_alignment_summary_metrics_2.8.1
    'sbg:x': 2133.903076171875
    'sbg:y': 1701.25
  - id: mv
    in:
      - id: infile
        source: trim_galore_0_6_2/clstats2
      - id: outfile
        default: trimming_report_R2.txt
        source: clstats2_rename
    out:
      - id: out
    run: command_line_tools/utilities_ubuntu_18.04/mv.cwl
    label: mv
    'sbg:x': 643.3338623046875
    'sbg:y': 1563.8671875
  - id: mv_1
    in:
      - id: infile
        source: trim_galore_0_6_2/clstats1
      - id: outfile
        default: trimming_report_R1.txt
        source: clstat1_rename
    out:
      - id: out
    run: command_line_tools/utilities_ubuntu_18.04/mv.cwl
    label: mv
    'sbg:x': 643.3338623046875
    'sbg:y': 1443.1015625
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
$schemas:
  - 'https://schema.org/docs/schema_org_rdfa.html'
's:author':
  - class: 's:Person'
    's:email': 'mailto:sumans@mskcc.org'
    's:identifier': ''
    's:name': Shalabh Suman
  - class: 's:Person'
    's:email': 'mailto:johnsoni@mskcc.org'
    's:identifier': ''
    's:name': Ian Jonhnson
's:citation': ''
's:codeRepository': 'https://github.com/msk-access/standard_bam_processing'
's:contributor':
  - class: 's:Person'
    's:email': 'mailto:johnsoni@mskcc.org'
    's:identifier': ''
    's:name': Ian Jonhnson
  - class: 's:Person'
    's:email': 'mailto:shahr2@mskcc.org'
    's:identifier': 'https://orcid.org/0000-0001-9042-6213'
    's:name': Ronak Shah
  - class: 's:Person'
    's:email': 'mailto:sumans@mskcc.org'
    's:identifier': ''
    's:name': Shalabh Suman
's:dateCreated': '2019-10-01'
's:license': 'https://spdx.org/licenses/Apache-2.0'
