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
  s: https://schema.org/
  sbg: 'https://www.sevenbridges.com/'

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html

inputs:
  - id: fastq2
    type: File
    'sbg:x': 0
    'sbg:y': 2991.625
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
    'sbg:y': 747.90625
  - id: known_sites_1
    type: File
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 2777.9375
  - id: known_sites_2
    type: File?
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 2671.09375
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2030.03125
  - id: fastq1
    type: File
    'sbg:x': 0
    'sbg:y': 3098.46875
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 854.75
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 961.59375
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 1068.4375
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 1175.28125
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 1282.125
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 1388.96875
  - id: P
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1709.5
  - id: output
    type: string?
    label: aln_output_file_name
    'sbg:x': 0
    'sbg:y': 1923.1875
  - id: output_file_name
    type: string?
    label: picard_output_file_name
    'sbg:x': 0
    'sbg:y': 1816.34375
  - id: window_size
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: soft_clip_contig
    type: string?
    'sbg:x': 0
    'sbg:y': 534.21875
  - id: scoring_gap_alignments
    type: string?
    'sbg:x': 0
    'sbg:y': 641.0625
  - id: maximum_mixmatch_rate
    type: float?
    'sbg:x': 0
    'sbg:y': 2243.71875
  - id: maximum_average_depth
    type: int?
    'sbg:x': 0
    'sbg:y': 2350.5625
  - id: ignore_bad_assembly
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2884.78125
  - id: contig_anchor
    type: string?
    'sbg:x': 0
    'sbg:y': 3205.3125
  - id: consensus_sequence
    type: boolean?
    'sbg:x': 0
    'sbg:y': 3312.15625
  - id: stringency
    type: int?
    label: trim_galore_stringency
    'sbg:x': 0
    'sbg:y': 320.53125
  - id: quality
    type: int?
    label: trim_galore_quality
    'sbg:x': 0
    'sbg:y': 1602.65625
  - id: length
    type: int?
    label: trim_galore_length
    'sbg:x': 0
    'sbg:y': 2564.25
  - id: adapter2
    type: string?
    'sbg:x': 0
    'sbg:y': 3419
  - id: adapter
    type: string?
    'sbg:x': 0
    'sbg:y': 3525.84375
  - id: number_of_threads
    type: int?
    label: abra_number_of_threads
    'sbg:x': 0
    'sbg:y': 2136.875
  - id: validation_stringency
    type: string?
    'sbg:x': 0
    'sbg:y': 106.84375
  - id: create_bam_index
    type: boolean?
    'sbg:x': 643.3338623046875
    'sbg:y': 1458.234375
  - id: assume_sorted
    type: boolean?
    'sbg:x': 643.3338623046875
    'sbg:y': 1778.765625
  - id: M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2457.40625
  - id: sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 427.375
  - id: trim_galore_number_of_threads
    type: int?
    'sbg:x': 0
    'sbg:y': 213.6875
  - id: read_filter
    type:
      - 'null'
      - type: array
        items: string
        inputBinding:
          prefix: '--read-filter'
    'sbg:x': 0
    'sbg:y': 1495.8125
outputs:
  - id: clstats2
    outputSource:
      - trim_galore_0_6_2/clstats2
    type: File
    'sbg:x': 643.3338623046875
    'sbg:y': 1565.078125
  - id: clstats1
    outputSource:
      - trim_galore_0_6_2/clstats1
    type: File
    'sbg:x': 643.3338623046875
    'sbg:y': 1671.921875
  - id: bqsr_bam
    outputSource:
      - calculate_apply_bqsr/bqsr_bam
    type: File?
    secondaryFiles:
      - ^.bai
    'sbg:x': 2133.903076171875
    'sbg:y': 1816.34375
  - id: md_bam
    outputSource:
      - picard_mark_duplicates_2_8_1/bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 1359.8614501953125
    'sbg:y': 1625.5
  - id: output_file
    outputSource:
      - abra_fx/output_file
    type: File?
    label: indel_realign_targets
    'sbg:x': 1854.496826171875
    'sbg:y': 1681.5
  - id: standard_bam_alignment_metrics
    outputSource:
      - picard_collect_alignment_summary_metrics_2_8_1/alignment_metrics
    type: File
    'sbg:x': 2439.8984375
    'sbg:y': 1762.921875
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
    'sbg:y': 1713.921875
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
    'sbg:y': 1741.921875
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
    'sbg:y': 1816.34375
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
    'sbg:y': 1816.34375
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
    'sbg:y': 1976.609375
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
    'sbg:y': 1702.5
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement

s:author:
  - class: s:Person
    s:identifier: ""
    s:email: mailto:sumans@mskcc.org
    s:name: Shalabh Suman
  - class: s:Person
    s:identifier: ""
    s:email: mailto:johnsoni@mskcc.org
    s:name: Ian Jonhnson
s:contributor:
  - class: s:Person
    s:identifier: ""
    s:email: mailto:johnsoni@mskcc.org
    s:name: Ian Jonhnson
  - class: s:Person
    s:identifier: https://orcid.org/0000-0001-9042-6213
    s:email: mailto:shahr2@mskcc.org
    s:name: Ronak Shah
  - class: s:Person
    s:identifier: ""
    s:email: mailto:sumans@mskcc.org
    s:name: Shalabh Suman
s:citation: ""
s:codeRepository: https://github.com/msk-access/standard_bam_processing
s:dateCreated: "2019-10-01"
s:license: https://spdx.org/licenses/Apache-2.0 
