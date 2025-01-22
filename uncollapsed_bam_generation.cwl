class: Workflow
cwlVersion: v1.0
id: uncollapsed_bam_generation
doc: >-
  This is the workflow is written using Common Workflow Language (CWL) version
  1.0 (https://www.commonwl.org/v1.0/) and is used at Memorial Sloan Kettering
  Cancer Center for producing standard bam files from the NY state-approved
  MSK-ACCESS assay. It is meant to be run on a single sample paired-end read 1
  and read 2 fastq's, from Illumina sequencing data, but may be generalizable to
  other sequencing platforms and sequencing panels as well, which produce
  paired-end data.
label: Uncollapsed BAM Generation
$namespaces:
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: fgbio_fastq_to_bam_umi-tag
    type: string?
    doc: 'Fgbio FastqToBam: Tag in which to store molecular barcodes/UMIs.'
    'sbg:x': 0
    'sbg:y': 2666.828125
  - id: fgbio_fastq_to_bam_sort
    type: boolean?
    doc: >-
      Fgbio FastqToBam: If true, queryname sort the BAM file, otherwise 
      preserve input order.
    'sbg:x': 0
    'sbg:y': 2773.5625
  - id: sequencing-center
    type: string
    doc: The sequencing center from which the data originated
    'sbg:x': 0
    'sbg:y': 426.71875
  - id: sample
    type: string
    doc: The name of the sequenced sample.
    'sbg:x': 0
    'sbg:y': 533.3984375
  - id: run-date
    type: string?
    doc: >-
      Date the run was produced, to insert into the read group header 
      (Iso8601Date)
    'sbg:x': 0
    'sbg:y': 640.0234375
  - id: read-structures
    type: 'string[]?'
    doc: 'Fgbio FastqToBam: Read structures, one for each of the FASTQs.'
    'sbg:x': 0
    'sbg:y': 853.2734375
  - id: read-group-id
    type: string
    doc: Read group ID to use in the file header.
    'sbg:x': 0
    'sbg:y': 959.953125
  - id: fgbio_fastq_to_bam_predicted-insert-size
    type: int?
    doc: >-
      Fgbio FastqToBam: Predicted median insert size, to insert into the read 
      group header
    'sbg:x': 0
    'sbg:y': 2880.296875
  - id: platform-unit
    type: string
    doc: Platform unit (e.g. "..")
    'sbg:x': 0
    'sbg:y': 1386.6171875
  - id: platform-model
    type: string
    doc: >-
      Platform model to insert into the group header (ex. miseq, hiseq2500, 
      hiseqX)
    'sbg:x': 0
    'sbg:y': 1493.2421875
  - id: platform
    type: string
    doc: Sequencing Platform.
    'sbg:x': 0
    'sbg:y': 1599.8671875
  - id: fgbio_fastq_to_bam_output_file_name
    type: string?
    doc: 'Fgbio FastqToBam: The output SAM or BAM file to be written.'
    'sbg:x': 0
    'sbg:y': 2987.03125
  - id: library
    type: string
    doc: The name/ID of the sequenced library.
    'sbg:x': 0
    'sbg:y': 2133.15625
  - id: description
    type: string?
    doc: Description of the read group.
    'sbg:x': 0
    'sbg:y': 4693.6328125
  - id: comment
    type: string?
    doc: Comments to include in the output file’s header.
    'sbg:x': 0
    'sbg:y': 4800.2578125
  - id: validation_stringency
    type: string
    doc: >-
      Validation stringency for all SAM files read by this program. Setting 
      stringency to SILENT can improve performance when processing a BAM file 
      in which variable-length data (read, qualities, tags) do not otherwise 
      need to be decoded. The --VALIDATION_STRINGENCY argument is an enumerated
      type (ValidationStringency), which can have one of the following values:
      STRICT or LENIENT or SILENT
    'sbg:x': 0
    'sbg:y': 0
  - id: unpaired_fastq_file
    type: string?
    doc: Name of the Unpaired Fastq File
    'sbg:x': 0
    'sbg:y': 106.6796875
  - id: gatk_sam_to_fastq_include_non_primary_alignments
    type: boolean?
    doc: "\tIf true, include non-primary alignments in the output. Support of \n\tnon-primary alignments in SamToFastq is not comprehensive, so there \n\tmay be exceptions if this is set to true and there are paired reads \n\twith non-primary alignments."
    'sbg:x': 0
    'sbg:y': 2239.890625
  - id: gatk_sam_to_fastq_include_non_pf_reads
    type: boolean?
    doc: >-
      Include non-PF reads from the SAM file into the output FASTQ files.  PF
      means 'passes filtering'. Reads whose 'not passing quality controls'  flag
      is set are non-PF reads. See GATK Dictionary for more info.
    'sbg:x': 0
    'sbg:y': 2346.625
  - id: R1_output_fastq
    type: string
    doc: Name of the R1 output Fastq File
    'sbg:x': 0
    'sbg:y': 1279.9921875
  - id: R2_output_fastq
    type: string
    doc: Name of the R2 Fastq File
    'sbg:x': 0
    'sbg:y': 1173.3671875
  - id: reference_sequence
    type: File
    doc: >-
      Reference sequence file.  Please include ".fai", "^.dict", ".amb" , ".sa",
      ".bwt", ".pac", ".ann" as  secondary files if they are not present in the
      same location as the  ".fasta" file
    secondaryFiles:
      - .amb
      - .fai
      - .sa
      - ^.dict
      - .ann
      - .bwt
      - .pac
    'sbg:x': 0
    'sbg:y': 746.6484375
  - id: fastp_unpaired2_output_file_name
    type: string?
    doc: >-
      Fastp: For PE input, if read2 passed QC but read1 not, it will be written
      to  unpaired2. If --unpaired2 is same as --unpaired1 (default mode), both 
      unpaired reads will be written to this same file.
    'sbg:x': 0
    'sbg:y': 3307.1796875
  - id: fastp_unpaired1_output_file_name
    type: string?
    doc: >-
      Fastp: for PE input, if read1 passed QC but read2 not, it will be  written
      to unpaired1. Default is to discard it.
    'sbg:x': 0
    'sbg:y': 3413.8046875
  - id: fastp_read2_output_file_name
    type: string?
    doc: 'Fastp: Read2 output File Name'
    'sbg:x': 0
    'sbg:y': 3520.4296875
  - id: fastp_read2_adapter_sequence
    type: string?
    doc: >-
      Fastp: The adapter for read2 (PE data only). This is used if R1/R2 are
      found not overlapped. If not specified, it will be the same as 
      <adapter_sequence> (string)
    'sbg:x': 0
    'sbg:y': 3627.0546875
  - id: fastp_read1_output_file_name
    type: string
    doc: 'Fastp: Read1 output File Name'
    'sbg:x': 0
    'sbg:y': 3733.6796875
  - id: fastp_read1_adapter_sequence
    type: string?
    doc: >-
      Fastp: the adapter for read1. For SE data, if not specified, the adapter
      will be auto-detected. For PE data, this is used if R1/R2 are found not
      overlapped.
    'sbg:x': 0
    'sbg:y': 3840.3046875
  - id: fastp_minimum_read_length
    type: int?
    doc: >-
      Fastp: reads shorter than length_required will be discarded, default is
      15.
    'sbg:x': 0
    'sbg:y': 3946.984375
  - id: fastp_json_output_file_name
    type: string
    doc: 'Fastp: the json format report file name'
    'sbg:x': 0
    'sbg:y': 4373.703125
  - id: fastp_html_output_file_name
    type: string
    doc: 'Fastp: the html format report file name'
    'sbg:x': 0
    'sbg:y': 4480.3828125
  - id: fastp_failed_reads_output_file_name
    type: string?
    doc: 'Fastp: specify the file to store reads that cannot pass the filters.'
    'sbg:x': 0
    'sbg:y': 4587.0078125
  - id: bwa_mem_Y
    type: boolean?
    doc: 'BWA MEM: use soft clipping for supplementary alignments'
    'sbg:x': 0
    'sbg:y': 5013.5078125
  - id: bwa_mem_T
    type: int?
    doc: 'BWA MEM: minimum score to output [30]'
    'sbg:x': 0
    'sbg:y': 5120.1328125
  - id: sort_order
    type: string
    doc: 'GATK: The order in which the reads should be output.'
    'sbg:x': 0
    'sbg:y': 320.0390625
  - id: bwa_mem_P
    type: boolean?
    doc: 'BWA MEM: skip pairing; mate rescue performed unless -S also in use'
    'sbg:x': 0
    'sbg:y': 5226.7578125
  - id: picard_addRG_output_file_name
    type: string?
    doc: Output BAM file name
    'sbg:x': 0
    'sbg:y': 1919.7421875
  - id: bwa_mem_output
    type: string?
    doc: Output SAM file name
    'sbg:x': 0
    'sbg:y': 5333.3828125
  - id: bwa_mem_M
    type: boolean?
    doc: 'BWA MEM: mark shorter split hits as secondary'
    'sbg:x': 0
    'sbg:y': 5440.0078125
  - id: bwa_mem_K
    type: int?
    doc: >-
      process INT input bases in each batch regardless of nThreads (for
      reproducibility)
    'sbg:x': 0
    'sbg:y': 5546.6328125
  - id: create_bam_index
    type: boolean
    doc: 'GATK: Generate BAM index file when possible'
    'sbg:x': 1470.052490234375
    'sbg:y': 2933.390625
  - id: gatk_merge_bam_alignment_output_file_name
    type: string?
    doc: Output BAM file name
    'sbg:x': 0
    'sbg:y': 2560.09375
  - id: optical_duplicate_pixel_distance
    type: int?
    doc: >-
      Picard MarkDuplicates: The maximum offset between two duplicate clusters 
      in order to consider them optical duplicates. The default is appropriate 
      for unpatterned versions of the Illumina platform. For the patterned 
      flowcell models, 2500 is more appropriate. For other platforms and
      models,  users should experiment to find what works best.
    'sbg:x': 2037.8385009765625
    'sbg:y': 2245.828125
  - id: duplicate_scoring_strategy
    type: string?
    doc: >-
      Picard MarkDuplicates: The scoring strategy for choosing the 
      non-duplicate among candidates.
    'sbg:x': 2037.8385009765625
    'sbg:y': 3300.8046875
  - id: read_name_regex
    type: string?
    doc: >-
      Picard MarkDuplicates: Regular expression that can be used to parse read 
      names in the incoming SAM file. Read names are parsed to extract three 
      variables: tile/region, x coordinate and y coordinate. These values are 
      used to estimate the rate of optical duplication in order to give a more 
      accurate estimated library size. Set this option to null to disable 
      optical duplicate detection, e.g. for RNA-seq or other data where 
      duplicate sets are extremely large and estimating library complexity is
      not an aim. Note that without optical duplicate counts, library size 
      estimation will be inaccurate. The regular expression should contain 
      three capture groups for the three variables, in order. It must match the 
      entire read name. Note that if the default regex is specified, a regex 
      match is not actually done, but instead the read name is split on colon 
      character. For 5 element names, the 3rd, 4th and 5th elements are assumed
      to be tile, x and y values. For 7 element names (CASAVA 1.8), the 5th, 
      6th, and 7th elements are assumed to be tile, x and y values.
    'sbg:x': 0
    'sbg:y': 1066.6875
  - id: gatk_mark_duplicates_output_file_name
    type: string?
    doc: 'Picard MarkDuplicates: The output file to write marked records to'
    'sbg:x': 2037.8385009765625
    'sbg:y': 2649.9765625
  - id: gatk_mark_duplicates_duplication_metrics_file_name
    type: string
    doc: 'Picard MarkDuplicates: File to write duplication metrics to'
    'sbg:x': 2037.8385009765625
    'sbg:y': 2756.7109375
  - id: gatk_mark_duplicates_assume_sort_order
    type: string?
    doc: >-
      Picard MarkDuplicates: If not null, assume that the input file has this 
      order even if the header says otherwise.
    'sbg:x': 2037.8385009765625
    'sbg:y': 2863.4453125
  - id: abra2_window_size
    type: string?
    doc: >-
      ABRA2: Processing window size and overlap (size,overlap)  (default:
      400,200)
    'sbg:x': 2590.802734375
    'sbg:y': 2653.5625
  - id: abra2_soft_clip_contig
    type: string?
    doc: >-
      ABRA2: Soft clip contig args [maxcontigs,min_base_qual,frac 
      high_qual_bases,min_soft_clip_len] (default:16,13,80,15)
    'sbg:x': 2590.802734375
    'sbg:y': 2866.9765625
  - id: abra2_scoring_gap_alignments
    type: string?
    'sbg:x': 2590.802734375
    'sbg:y': 2973.7109375
  - id: abra2_output_bams
    type:
      - string
      - type: array
        items: string
    doc: Required list of output sam or bam file
    'sbg:x': 2590.802734375
    'sbg:y': 3080.390625
  - id: abra2_maximum_average_depth
    type: int?
    doc: >-
      ABRA2: Regions with average depth exceeding this value will be 
      downsampled (default: 1000)
    'sbg:x': 2590.802734375
    'sbg:y': 3507.0546875
  - id: abra2_bam_index
    type: boolean?
    doc: 'ABRA2: Generate BAM Index'
    'sbg:x': 2590.802734375
    'sbg:y': 3827.09375
  - id: abra2_contig_anchor
    type: string?
    'sbg:x': 2590.802734375
    'sbg:y': 3613.7890625
  - id: abra2_consensus_sequence
    type: boolean?
    doc: >-
      ABRA2: Contig anchor [M_bases_at_contig_edge,max_mismatches_near_edge] 
      (default:10,2)
    'sbg:x': 2590.802734375
    'sbg:y': 3720.46875
  - id: abra2_maximum_mixmatch_rate
    type: float?
    doc: |-
      max allowed mismatch rate when mapping
      reads back to contigs (default: 0.05)
    'sbg:x': 2590.802734375
    'sbg:y': 3400.375
  - id: picard_fixmateinformation_output_file_name
    type: string?
    doc: 'Picard FixMateInformation: The output BAM file to write to'
    'sbg:x': 0
    'sbg:y': 1706.4921875
  - id: abra2_no_sort
    type: boolean?
    doc: 'ABRA2: Do not attempt to sort final output'
    'sbg:x': 2590.802734375
    'sbg:y': 3187.015625
  - id: abra2_no_edge_complex_indel
    type: boolean?
    doc: 'ABRA2: Prevent output of complex indels at read start or read end'
    'sbg:x': 2590.802734375
    'sbg:y': 3293.6953125
  - id: merge_sam_files_sort_order
    type: string
    doc: 'GATK MergeSamFiles: Sort order of output file'
    'sbg:x': 0
    'sbg:y': 2026.421875
  - id: gatk_merge_sam_files_output_file_name
    type: string?
    doc: 'GATK MergeSamFiles: SAM or BAM file to write merged result to'
    'sbg:x': 0
    'sbg:y': 2453.359375
  - id: bwa_number_of_threads
    type: int?
    doc: 'BWA MEM: Number of threads'
    'sbg:x': 0
    'sbg:y': 4906.8828125
  - id: fgbio_fastq_to_bam_input
    type:
      type: array
      items:
        items: File
        type: array
    doc: >-
      Fgbio FastqToBam: Fastq files corresponding to each sequencing read ( e.g.
      R1, I1, etc.).
    'sbg:x': 0
    'sbg:y': 3093.765625
  - id: picard_addRG_sort_order
    type: string
    'sbg:x': 0
    'sbg:y': 1813.1171875
  - id: disable_trim_poly_g
    type: boolean?
    'sbg:x': 1470.052490234375
    'sbg:y': 2719.9765625
  - id: disable_quality_filtering
    type: boolean?
    'sbg:x': 1470.052490234375
    'sbg:y': 2826.7109375
  - id: temporary_directory
    type: string?
    'sbg:x': 0
    'sbg:y': 213.359375
  - id: fgbio_async_io
    type: string?
    'sbg:x': 0
    'sbg:y': 3200.5
  - id: fastp_maximum_read_length
    type: int?
    'sbg:x': 0
    'sbg:y': 4053.71875
  - id: fastp_max_len_read1
    type: int?
    'sbg:x': 0
    'sbg:y': 4267.0234375
  - id: fastp_max_len_read2
    type: int?
    'sbg:x': 0
    'sbg:y': 4160.3984375
  - id: abra2_targets
    type: File
    'sbg:x': 2590.802734375
    'sbg:y': 2760.2421875
outputs:
  - id: gatk_sam_to_fastq_unpaired_fastq
    outputSource:
      - gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_unpaired_fastq
    type: File?
    'sbg:x': 2037.8385009765625
    'sbg:y': 2352.5078125
  - id: fastp_unpaired2_output
    outputSource:
      - fastp_0_20_1/fastp_unpaired2_output
    type: File?
    'sbg:x': 2590.802734375
    'sbg:y': 1826.21875
  - id: fastp_unpaired1_output
    outputSource:
      - fastp_0_20_1/fastp_unpaired1_output
    type: File?
    'sbg:x': 2590.802734375
    'sbg:y': 1932.84375
  - id: fastp_json_output
    outputSource:
      - fastp_0_20_1/fastp_json_output
    type: File
    'sbg:x': 2590.802734375
    'sbg:y': 2039.5234375
  - id: fastp_html_output
    outputSource:
      - fastp_0_20_1/fastp_html_output
    type: File
    'sbg:x': 2590.802734375
    'sbg:y': 2146.203125
  - id: picard_mark_duplicates_metrics
    outputSource:
      - picard_mark_duplicates_4_1_8_1/picard_mark_duplicates_metrics
    type: File
    'sbg:x': 3362.353515625
    'sbg:y': 2593.9765625
  - id: indel_realignment_bam
    outputSource:
      - indel_realignment_staticbed/indel_realignment_bam
    type: File
    doc: This bam file will be used for collapsing
    secondaryFiles:
      - ^.bai
    'sbg:x': 3953.07421875
    'sbg:y': 2773.2890625
steps:
  - id: fgbio_fastq_to_bam_1_2_0
    in:
      - id: input
        source:
          - fgbio_fastq_to_bam_input
      - id: output_file_name
        source: fgbio_fastq_to_bam_output_file_name
      - id: read-structures
        source:
          - read-structures
      - id: sort
        source: fgbio_fastq_to_bam_sort
      - id: umi-tag
        source: fgbio_fastq_to_bam_umi-tag
      - id: read-group-id
        source: read-group-id
      - id: sample
        source: sample
      - id: library
        source: library
      - id: platform
        source: platform
      - id: platform-unit
        source: platform-unit
      - id: platform-model
        source: platform-model
      - id: sequencing-center
        source: sequencing-center
      - id: predicted-insert-size
        source: fgbio_fastq_to_bam_predicted-insert-size
      - id: description
        source: description
      - id: comment
        source: comment
      - id: run-date
        source: run-date
      - id: temporary_directory
        source: temporary_directory
      - id: async_io
        source: fgbio_async_io
    out:
      - id: fgbio_fastq_to_bam_ubam
    run: command_line_tools/fgbio_fastq_to_bam_1.2.0/fgbio_fastq_to_bam_1.2.0.cwl
    label: fgbio_fastq_to_bam_1.2.0
    scatter:
      - input
    scatterMethod: dotproduct
    'sbg:x': 477.953125
    'sbg:y': 2654.2890625
  - id: gatk_sam_to_fastq_4_1_8_0
    in:
      - id: fastq
        source: R1_output_fastq
      - id: input
        source: gatk_merge_sam_files_4_1_8_0/gatk_merge_sam_files_bam
      - id: include_non_pf_reads
        source: gatk_sam_to_fastq_include_non_pf_reads
      - id: include_non_primary_alignments
        source: gatk_sam_to_fastq_include_non_primary_alignments
      - id: reference_sequence
        source: reference_sequence
      - id: second_end_fastq
        source: R2_output_fastq
      - id: unpaired_fastq
        source: unpaired_fastq_file
      - id: validation_stringency
        source: validation_stringency
      - id: temporary_directory
        source: temporary_directory
    out:
      - id: gatk_sam_to_fastq_fastq
      - id: gatk_sam_to_fastq_unpaired_fastq
      - id: gatk_sam_to_fastq_second_end_fastq
    run: command_line_tools/gatk_sam_to_fastq_4.1.8.0/gatk_sam_to_fastq_4.1.8.0.cwl
    label: GATK-SamToFastq
    'sbg:x': 1470.052490234375
    'sbg:y': 2557.296875
  - id: fastp_0_20_1
    in:
      - id: read1_input
        source: gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_fastq
      - id: read1_output_path
        source: fastp_read1_output_file_name
      - id: read2_input
        source: gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_second_end_fastq
      - id: read2_output_path
        source: fastp_read2_output_file_name
      - id: unpaired1_path
        source: fastp_unpaired1_output_file_name
      - id: unpaired2_path
        source: fastp_unpaired2_output_file_name
      - id: failed_reads_path
        source: fastp_failed_reads_output_file_name
      - id: read1_adapter_sequence
        source: fastp_read1_adapter_sequence
      - id: read2_adapter_sequence
        source: fastp_read2_adapter_sequence
      - id: minimum_read_length
        source: fastp_minimum_read_length
      - id: maximum_read_length
        source: fastp_maximum_read_length
      - id: max_len_read1
        source: fastp_max_len_read1
      - id: max_len_read2
        source: fastp_max_len_read2
      - id: json_output_path
        source: fastp_json_output_file_name
      - id: html_output_path
        source: fastp_html_output_file_name
      - id: disable_quality_filtering
        source: disable_quality_filtering
      - id: disable_trim_poly_g
        source: disable_trim_poly_g
    out:
      - id: fastp_json_output
      - id: fastp_html_output
      - id: fastp_read1_output
      - id: fastp_read2_output
      - id: fastp_unpaired1_output
      - id: fastp_unpaired2_output
    run: command_line_tools/fastp_0.20.1/fastp_0.20.1.cwl
    label: fastp_0.20.1
    'sbg:x': 2037.8385009765625
    'sbg:y': 3082.125
  - id: alignment
    in:
      - id: create_bam_index
        source: create_bam_index
      - id: output_file_name
        source: picard_addRG_output_file_name
      - id: read_group_description
        source: description
      - id: read_group_identifier
        source: read-group-id
      - id: read_group_library
        source: library
      - id: read_group_platform_unit
        source: platform-unit
      - id: read_group_run_date
        source: run-date
      - id: read_group_sample_name
        source: sample
      - id: read_group_sequencing_center
        source: sequencing-center
      - id: read_group_sequencing_platform
        source: platform
      - id: sort_order
        source: picard_addRG_sort_order
      - id: validation_stringency
        source: validation_stringency
      - id: reference
        source: reference_sequence
      - id: reads
        source:
          - fastp_0_20_1/fastp_read1_output
          - fastp_0_20_1/fastp_read2_output
      - id: output
        source: bwa_mem_output
      - id: P
        source: bwa_mem_P
      - id: M
        source: bwa_mem_M
      - id: T
        source: bwa_mem_T
      - id: 'Y'
        source: bwa_mem_Y
      - id: K
        source: bwa_mem_K
      - id: bwa_number_of_threads
        source: bwa_number_of_threads
      - id: temporary_directory
        source: temporary_directory
    out:
      - id: picard_add_or_replace_read_groups_bam
    run: subworkflows/alignment/alignment.cwl
    label: alignment
    'sbg:x': 2590.802734375
    'sbg:y': 2399.8828125
  - id: gatk_merge_bam_alignment_4_1_8_0
    in:
      - id: unmapped_bam
        source: gatk_merge_sam_files_4_1_8_0/gatk_merge_sam_files_bam
      - id: reference
        source: reference_sequence
      - id: output_file_name
        source: gatk_merge_bam_alignment_output_file_name
      - id: aligned_bam
        source:
          - alignment/picard_add_or_replace_read_groups_bam
        valueFrom: '${ return [ self ]; }'
      - id: validation_stringency
        source: validation_stringency
      - id: create_index
        source: create_bam_index
      - id: temporary_directory
        source: temporary_directory
    out:
      - id: gatk_merge_bam_alignment_bam
    run: >-
      command_line_tools/gatk_merge_bam_alignment_4.1.8.0/gatk_merge_bam_alignment_4.1.8.0.cwl
    label: GATK-MergeBamAlignment
    'sbg:x': 2037.8385009765625
    'sbg:y': 2501.2421875
  - id: picard_mark_duplicates_4_1_8_1
    in:
      - id: input
        source: gatk_merge_bam_alignment_4_1_8_0/gatk_merge_bam_alignment_bam
      - id: output_file_name
        source: gatk_mark_duplicates_output_file_name
      - id: duplication_metrics
        source: gatk_mark_duplicates_duplication_metrics_file_name
      - id: assume_sort_order
        source: gatk_mark_duplicates_assume_sort_order
      - id: validation_stringency
        source: validation_stringency
      - id: create_bam_index
        source: create_bam_index
      - id: read_name_regex
        source: read_name_regex
      - id: duplicate_scoring_strategy
        source: duplicate_scoring_strategy
      - id: optical_duplicate_pixel_distance
        source: optical_duplicate_pixel_distance
      - id: temporary_directory
        source: temporary_directory
    out:
      - id: picard_mark_duplicates_bam
      - id: picard_mark_duplicates_metrics
    run: >-
      command_line_tools/picard_mark_duplicates_4.1.8.1/picard_mark_duplicates_4.1.8.1.cwl
    label: picard_mark_duplicates_4.1.8.1
    'sbg:x': 2590.802734375
    'sbg:y': 1656.59375
  - id: indel_realignment_staticbed
    in:
      - id: window_size
        source: abra2_window_size
      - id: soft_clip_contig
        source: abra2_soft_clip_contig
      - id: scoring_gap_alignments
        source: abra2_scoring_gap_alignments
      - id: reference_fasta
        source: reference_sequence
      - id: no_sort
        source: abra2_no_sort
      - id: maximum_mixmatch_rate
        source: abra2_maximum_mixmatch_rate
      - id: maximum_average_depth
        source: abra2_maximum_average_depth
      - id: input_bam
        source: picard_mark_duplicates_4_1_8_1/picard_mark_duplicates_bam
      - id: contig_anchor
        source: abra2_contig_anchor
      - id: consensus_sequence
        source: abra2_consensus_sequence
      - id: bam_index
        source: abra2_bam_index
      - id: no_edge_complex_indel
        source: abra2_no_edge_complex_indel
      - id: output_bams
        source:
          - abra2_output_bams
      - id: validation_stringency
        source: validation_stringency
      - id: sort_order
        source: sort_order
      - id: output_file_name
        source: picard_fixmateinformation_output_file_name
      - id: create_bam_index
        source: create_bam_index
      - id: temporary_directory
        source: temporary_directory
      - id: targets
        source: abra2_targets
    out:
      - id: indel_realignment_bam
    run: subworkflows/indel_realignment/indel_realignment_staticbed.cwl
    label: indel_realignment
    'sbg:x': 3362.353515625
    'sbg:y': 2826.65625
  - id: gatk_merge_sam_files_4_1_8_0
    in:
      - id: input
        source:
          - fgbio_fastq_to_bam_1_2_0/fgbio_fastq_to_bam_ubam
      - id: output_file_name
        source: gatk_merge_sam_files_output_file_name
      - id: reference_sequence
        source: reference_sequence
      - id: sort_order
        source: merge_sam_files_sort_order
      - id: validation_stringency
        source: validation_stringency
      - id: temporary_directory
        source: temporary_directory
    out:
      - id: gatk_merge_sam_files_bam
    run: >-
      command_line_tools/gatk_merge_sam_files_4.1.8.0/gatk_merge_sam_files_4.1.8.0.cwl
    label: GATK-MergeSamFiles
    'sbg:x': 1053.5057373046875
    'sbg:y': 2738.2890625
requirements:
  - class: SubworkflowFeatureRequirement
  - class: ScatterFeatureRequirement
  - class: MultipleInputFeatureRequirement
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement
$schemas:
  - 'http://schema.org/version/latest/schemaorg-current-http.rdf'
's:author':
  - class: 's:Person'
    's:email': 'mailto:shahr2@mskcc.org'
    's:identifier': ''
    's:name': Ronak Shah
's:citation': ''
's:codeRepository': 'https://github.com/msk-access/uncollapsed_bam_generation'
's:contributor':
  - class: 's:Person'
    's:email': 'mailto:shahr2@mskcc.org'
    's:identifier': 'https://orcid.org/0000-0001-9042-6213'
    's:name': Ronak Shah
's:dateCreated': '2020-09-23'
's:license': 'https://spdx.org/licenses/Apache-2.0'
