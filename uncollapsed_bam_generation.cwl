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
    'sbg:y': 2881.828125
  - id: fgbio_fastq_to_bam_sort
    type: boolean?
    doc: >-
      Fgbio FastqToBam: If true, queryname sort the BAM file, otherwise 
      preserve input order.
    'sbg:x': 0
    'sbg:y': 2988.5625
  - id: sequencing-center
    type: string
    doc: The sequencing center from which the data originated
    'sbg:x': 0
    'sbg:y': 320.203125
  - id: sample
    type: string
    doc: The name of the sequenced sample.
    'sbg:x': 0
    'sbg:y': 426.9375
  - id: run-date
    type: string?
    doc: >-
      Date the run was produced, to insert into the read group header 
      (Iso8601Date)
    'sbg:x': 0
    'sbg:y': 533.671875
  - id: read-structures
    type: 'string[]?'
    doc: 'Fgbio FastqToBam: Read structures, one for each of the FASTQs.'
    'sbg:x': 0
    'sbg:y': 747.140625
  - id: read-group-id
    type: string
    doc: Read group ID to use in the file header.
    'sbg:x': 0
    'sbg:y': 853.875
  - id: fgbio_fastq_to_bam_predicted-insert-size
    type: int?
    doc: >-
      Fgbio FastqToBam: Predicted median insert size, to insert into the read 
      group header
    'sbg:x': 0
    'sbg:y': 3095.296875
  - id: platform-unit
    type: string
    doc: Platform unit (e.g. "..")
    'sbg:x': 0
    'sbg:y': 1280.8125
  - id: platform-model
    type: string
    doc: >-
      Platform model to insert into the group header (ex. miseq, hiseq2500, 
      hiseqX)
    'sbg:x': 0
    'sbg:y': 1387.546875
  - id: platform
    type: string
    doc: Sequencing Platform.
    'sbg:x': 0
    'sbg:y': 1494.28125
  - id: fgbio_fastq_to_bam_output_file_name
    type: string?
    doc: 'Fgbio FastqToBam: The output SAM or BAM file to be written.'
    'sbg:x': 0
    'sbg:y': 3202.03125
  - id: library
    type: string
    doc: The name/ID of the sequenced library.
    'sbg:x': 0
    'sbg:y': 2027.953125
  - id: description
    type: string?
    doc: Description of the read group.
    'sbg:x': 0
    'sbg:y': 4482.84375
  - id: comment
    type: string?
    doc: Comments to include in the output file’s header.
    'sbg:x': 0
    'sbg:y': 4589.578125
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
    'sbg:y': 106.734375
  - id: gatk_sam_to_fastq_include_non_primary_alignments
    type: boolean?
    doc: "\tIf true, include non-primary alignments in the output. Support of \n\tnon-primary alignments in SamToFastq is not comprehensive, so there \n\tmay be exceptions if this is set to true and there are paired reads \n\twith non-primary alignments."
    'sbg:x': 0
    'sbg:y': 2134.6875
  - id: gatk_sam_to_fastq_include_non_pf_reads
    type: boolean?
    doc: >-
      Include non-PF reads from the SAM file into the output FASTQ files.  PF
      means 'passes filtering'. Reads whose 'not passing quality controls'  flag
      is set are non-PF reads. See GATK Dictionary for more info.
    'sbg:x': 0
    'sbg:y': 2241.421875
  - id: R1_output_fastq
    type: string
    doc: Name of the R1 output Fastq File
    'sbg:x': 0
    'sbg:y': 1174.078125
  - id: R2_output_fastq
    type: string
    doc: Name of the R2 Fastq File
    'sbg:x': 0
    'sbg:y': 1067.34375
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
    'sbg:y': 640.40625
  - id: fastp_unpaired2_output_file_name
    type: string?
    doc: >-
      Fastp: For PE input, if read2 passed QC but read1 not, it will be written
      to  unpaired2. If --unpaired2 is same as --unpaired1 (default mode), both 
      unpaired reads will be written to this same file.
    'sbg:x': 0
    'sbg:y': 3415.5
  - id: fastp_unpaired1_output_file_name
    type: string?
    doc: >-
      Fastp: for PE input, if read1 passed QC but read2 not, it will be  written
      to unpaired1. Default is to discard it.
    'sbg:x': 0
    'sbg:y': 3522.234375
  - id: fastp_read2_output_file_name
    type: string?
    doc: 'Fastp: Read2 output File Name'
    'sbg:x': 0
    'sbg:y': 3628.96875
  - id: fastp_read2_adapter_sequence
    type: string?
    doc: >-
      Fastp: The adapter for read2 (PE data only). This is used if R1/R2 are
      found not overlapped. If not specified, it will be the same as 
      <adapter_sequence> (string)
    'sbg:x': 0
    'sbg:y': 3735.703125
  - id: fastp_read1_output_file_name
    type: string
    doc: 'Fastp: Read1 output File Name'
    'sbg:x': 0
    'sbg:y': 3842.4375
  - id: fastp_read1_adapter_sequence
    type: string?
    doc: >-
      Fastp: the adapter for read1. For SE data, if not specified, the adapter
      will be auto-detected. For PE data, this is used if R1/R2 are found not
      overlapped.
    'sbg:x': 0
    'sbg:y': 3949.171875
  - id: fastp_minimum_read_length
    type: int?
    doc: >-
      Fastp: reads shorter than length_required will be discarded, default is
      15.
    'sbg:x': 0
    'sbg:y': 4055.90625
  - id: fastp_json_output_file_name
    type: string
    doc: 'Fastp: the json format report file name'
    'sbg:x': 0
    'sbg:y': 4162.640625
  - id: fastp_html_output_file_name
    type: string
    doc: 'Fastp: the html format report file name'
    'sbg:x': 0
    'sbg:y': 4269.375
  - id: fastp_failed_reads_output_file_name
    type: string?
    doc: 'Fastp: specify the file to store reads that cannot pass the filters.'
    'sbg:x': 0
    'sbg:y': 4376.109375
  - id: bwa_mem_Y
    type: boolean?
    doc: 'BWA MEM: use soft clipping for supplementary alignments'
    'sbg:x': 0
    'sbg:y': 4803.046875
  - id: bwa_mem_T
    type: int?
    doc: 'BWA MEM: minimum score to output [30]'
    'sbg:x': 0
    'sbg:y': 4909.78125
  - id: sort_order
    type: string
    doc: 'GATK: The order in which the reads should be output.'
    'sbg:x': 0
    'sbg:y': 213.46875
  - id: bwa_mem_P
    type: boolean?
    doc: 'BWA MEM: skip pairing; mate rescue performed unless -S also in use'
    'sbg:x': 0
    'sbg:y': 5016.515625
  - id: picard_addRG_output_file_name
    type: string?
    doc: Output BAM file name
    'sbg:x': 0
    'sbg:y': 1814.484375
  - id: bwa_mem_output
    type: string?
    doc: Output SAM file name
    'sbg:x': 0
    'sbg:y': 5123.25
  - id: bwa_mem_M
    type: boolean?
    doc: 'BWA MEM: mark shorter split hits as secondary'
    'sbg:x': 0
    'sbg:y': 5229.984375
  - id: bwa_mem_K
    type: int?
    doc: >-
      process INT input bases in each batch regardless of nThreads (for
      reproducibility)
    'sbg:x': 0
    'sbg:y': 5336.71875
  - id: create_bam_index
    type: boolean
    doc: 'GATK: Generate BAM index file when possible'
    'sbg:x': 1429.1334228515625
    'sbg:y': 2775.09375
  - id: gatk_merge_bam_alignment_output_file_name
    type: string?
    doc: Output BAM file name
    'sbg:x': 0
    'sbg:y': 2454.890625
  - id: optical_duplicate_pixel_distance
    type: int?
    doc: >-
      Picard MarkDuplicates: The maximum offset between two duplicate clusters 
      in order to consider them optical duplicates. The default is appropriate 
      for unpatterned versions of the Illumina platform. For the patterned 
      flowcell models, 2500 is more appropriate. For other platforms and
      models,  users should experiment to find what works best.
    'sbg:x': 1986.771728515625
    'sbg:y': 2236.15625
  - id: duplicate_scoring_strategy
    type: string?
    doc: >-
      Picard MarkDuplicates: The scoring strategy for choosing the 
      non-duplicate among candidates.
    'sbg:x': 1986.771728515625
    'sbg:y': 3207.296875
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
    'sbg:y': 960.609375
  - id: gatk_mark_duplicates_output_file_name
    type: string?
    doc: 'Picard MarkDuplicates: The output file to write marked records to'
    'sbg:x': 1986.771728515625
    'sbg:y': 2626.359375
  - id: gatk_mark_duplicates_duplication_metrics_file_name
    type: string
    doc: 'Picard MarkDuplicates: File to write duplication metrics to'
    'sbg:x': 1986.771728515625
    'sbg:y': 2733.09375
  - id: gatk_mark_duplicates_assume_sort_order
    type: string?
    doc: >-
      Picard MarkDuplicates: If not null, assume that the input file has this 
      order even if the header says otherwise.
    'sbg:x': 1986.771728515625
    'sbg:y': 2839.828125
  - id: abra2_window_size
    type: string?
    doc: >-
      ABRA2: Processing window size and overlap (size,overlap)  (default:
      400,200)
    'sbg:x': 2471.29443359375
    'sbg:y': 2754.9921875
  - id: abra2_soft_clip_contig
    type: string?
    doc: >-
      ABRA2: Soft clip contig args [maxcontigs,min_base_qual,frac 
      high_qual_bases,min_soft_clip_len] (default:16,13,80,15)
    'sbg:x': 2471.29443359375
    'sbg:y': 2861.7265625
  - id: abra2_scoring_gap_alignments
    type: string?
    'sbg:x': 2471.29443359375
    'sbg:y': 2968.4609375
  - id: abra2_output_bams
    type:
      - string
      - type: array
        items: string
    doc: Required list of output sam or bam file
    'sbg:x': 2471.29443359375
    'sbg:y': 3075.1953125
  - id: abra2_maximum_average_depth
    type: int?
    doc: >-
      ABRA2: Regions with average depth exceeding this value will be 
      downsampled (default: 1000)
    'sbg:x': 2471.29443359375
    'sbg:y': 3502.1328125
  - id: abra2_bam_index
    type: boolean?
    doc: 'ABRA2: Generate BAM Index'
    'sbg:x': 2471.29443359375
    'sbg:y': 3822.3359375
  - id: abra2_contig_anchor
    type: string?
    'sbg:x': 2471.29443359375
    'sbg:y': 3608.8671875
  - id: abra2_consensus_sequence
    type: boolean?
    doc: >-
      ABRA2: Contig anchor [M_bases_at_contig_edge,max_mismatches_near_edge] 
      (default:10,2)
    'sbg:x': 2471.29443359375
    'sbg:y': 3715.6015625
  - id: bedtools_merge_distance_between_features
    type: int?
    'sbg:x': 2471.29443359375
    'sbg:y': 2154.7890625
  - id: abra2_maximum_mixmatch_rate
    type: float?
    doc: |-
      max allowed mismatch rate when mapping
      reads back to contigs (default: 0.05)
    'sbg:x': 2471.29443359375
    'sbg:y': 3395.3984375
  - id: bedtools_genomecov_option_bedgraph
    type: boolean?
    doc: >-
      bedtools genomecov: option flag parameter to choose output file format. 
      -bg refers to bedgraph format
    'sbg:x': 2471.29443359375
    'sbg:y': 2261.5234375
  - id: picard_fixmateinformation_output_file_name
    type: string?
    doc: 'Picard FixMateInformation: The output BAM file to write to'
    'sbg:x': 0
    'sbg:y': 1601.015625
  - id: abra2_no_sort
    type: boolean?
    doc: 'ABRA2: Do not attempt to sort final output'
    'sbg:x': 2471.29443359375
    'sbg:y': 3181.9296875
  - id: abra2_no_edge_complex_indel
    type: boolean?
    doc: 'ABRA2: Prevent output of complex indels at read start or read end'
    'sbg:x': 2471.29443359375
    'sbg:y': 3288.6640625
  - id: gatk_bqsr_read_filter
    type:
      - 'null'
      - type: array
        items: string
        inputBinding:
          prefix: '--read-filter'
    doc: 'GATK BQSR: Read filters to be enabled before analysis'
    'sbg:x': 0
    'sbg:y': 2561.625
  - id: gatk_base_recalibrator_known_sites
    type:
      type: array
      items: File
      inputBinding:
        prefix: '--known-sites'
    doc: >-
      GATK BaseRecalibrator: One or more databases of known polymorphic sites 
      used to exclude regions around known polymorphisms from analysis.
    secondaryFiles:
      - .idx
    'sbg:x': 0
    'sbg:y': 2775.09375
  - id: gatk_bqsr_disable_read_filter
    type:
      - 'null'
      - type: array
        items: string
        inputBinding:
          prefix: '--disable-read-filter'
    doc: 'GATK BQSR: Read filters to be disabled before analysis'
    'sbg:x': 0
    'sbg:y': 2668.359375
  - id: base_recalibrator_output_file_name
    type: string?
    doc: 'GATK BaseRecalibrator: The output recalibration table file to create'
    'sbg:x': 0
    'sbg:y': 5443.453125
  - id: apply_bqsr_output_file_name
    type: string?
    doc: 'GATK ApplyBQSR: The output BAM file'
    'sbg:x': 3224.2373046875
    'sbg:y': 2954.4609375
  - id: merge_sam_files_sort_order
    type: string
    doc: 'GATK MergeSamFiles: Sort order of output file'
    'sbg:x': 0
    'sbg:y': 1921.21875
  - id: gatk_merge_sam_files_output_file_name
    type: string?
    doc: 'GATK MergeSamFiles: SAM or BAM file to write merged result to'
    'sbg:x': 0
    'sbg:y': 2348.15625
  - id: bwa_number_of_threads
    type: int?
    doc: 'BWA MEM: Number of threads'
    'sbg:x': 0
    'sbg:y': 4696.3125
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
    'sbg:y': 3308.765625
  - id: picard_addRG_sort_order
    type: string
    'sbg:x': 0
    'sbg:y': 1707.75
outputs:
  - id: gatk_sam_to_fastq_unpaired_fastq
    outputSource:
      - gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_unpaired_fastq
    type: File?
    'sbg:x': 1986.771728515625
    'sbg:y': 2342.890625
  - id: fastp_unpaired2_output
    outputSource:
      - fastp_0_20_1/fastp_unpaired2_output
    type: File?
    'sbg:x': 2471.29443359375
    'sbg:y': 1727.8515625
  - id: fastp_unpaired1_output
    outputSource:
      - fastp_0_20_1/fastp_unpaired1_output
    type: File?
    'sbg:x': 2471.29443359375
    'sbg:y': 1834.5859375
  - id: fastp_json_output
    outputSource:
      - fastp_0_20_1/fastp_json_output
    type: File
    'sbg:x': 2471.29443359375
    'sbg:y': 1941.3203125
  - id: fastp_html_output
    outputSource:
      - fastp_0_20_1/fastp_html_output
    type: File
    'sbg:x': 2471.29443359375
    'sbg:y': 2048.0546875
  - id: picard_mark_duplicates_metrics
    outputSource:
      - picard_mark_duplicates_4_1_8_1/picard_mark_duplicates_metrics
    type: File
    'sbg:x': 3224.2373046875
    'sbg:y': 2488.9921875
  - id: indel_realignment_bam
    outputSource:
      - indel_realignment/indel_realignment_bam
    type: File
    doc: This bam file will be used for collapsing
    secondaryFiles:
      - ^.bai
    'sbg:x': 3820.9423828125
    'sbg:y': 2619.359375
  - id: uncollapsed_bam
    outputSource:
      - base_quality_recalibration/gatk_apply_bqsr_bam
    type: File?
    doc: This is the uncollapsed bam used for SV and MSI
    secondaryFiles:
      - ^.bai
    'sbg:x': 4307.7060546875
    'sbg:y': 2661.359375
  - id: gatk_collect_alignment_summary_metrics_txt
    outputSource:
      - >-
        gatk_collect_alignment_summary_metrics_4_1_8_0/gatk_collect_alignment_summary_metrics_txt
    type: File
    'sbg:x': 4715.2841796875
    'sbg:y': 2721.7265625
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
    out:
      - id: fgbio_fastq_to_bam_ubam
    run: command_line_tools/fgbio_fastq_to_bam_1.2.0/fgbio_fastq_to_bam_1.2.0.cwl
    label: fgbio_fastq_to_bam_1.2.0
    scatter:
      - input
    scatterMethod: dotproduct
    'sbg:x': 477.984375
    'sbg:y': 2616.7265625
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
    out:
      - id: gatk_sam_to_fastq_fastq
      - id: gatk_sam_to_fastq_unpaired_fastq
      - id: gatk_sam_to_fastq_second_end_fastq
    run: command_line_tools/gatk_sam_to_fastq_4.1.8.0/gatk_sam_to_fastq_4.1.8.0.cwl
    label: GATK-SamToFastq
    'sbg:x': 1429.1334228515625
    'sbg:y': 2619.359375
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
      - id: json_output_path
        source: fastp_json_output_file_name
      - id: html_output_path
        source: fastp_html_output_file_name
    out:
      - id: fastp_json_output
      - id: fastp_html_output
      - id: fastp_read1_output
      - id: fastp_read2_output
      - id: fastp_unpaired1_output
      - id: fastp_unpaired2_output
    run: command_line_tools/fastp_0.20.1/fastp_0.20.1.cwl
    label: fastp_0.20.1
    'sbg:x': 1986.771728515625
    'sbg:y': 3023.5625
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
    out:
      - id: picard_add_or_replace_read_groups_bam
    run: subworkflows/alignment/alignment.cwl
    label: alignment
    'sbg:x': 2471.29443359375
    'sbg:y': 2508.2578125
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
    out:
      - id: gatk_merge_bam_alignment_bam
    run: >-
      command_line_tools/gatk_merge_bam_alignment_4.1.8.0/gatk_merge_bam_alignment_4.1.8.0.cwl
    label: GATK-MergeBamAlignment
    'sbg:x': 1986.771728515625
    'sbg:y': 2484.625
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
    out:
      - id: picard_mark_duplicates_bam
      - id: picard_mark_duplicates_metrics
    run: >-
      command_line_tools/picard_mark_duplicates_4.1.8.1/picard_mark_duplicates_4.1.8.1.cwl
    label: picard_mark_duplicates_4.1.8.1
    'sbg:x': 2471.29443359375
    'sbg:y': 1565.1171875
  - id: indel_realignment
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
      - id: option_bedgraph
        source: bedtools_genomecov_option_bedgraph
      - id: no_edge_complex_indel
        source: abra2_no_edge_complex_indel
      - id: distance_between_features
        source: bedtools_merge_distance_between_features
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
    out:
      - id: indel_realignment_bam
    run: subworkflows/indel_realignment/indel_realignment.cwl
    label: indel_realignment
    'sbg:x': 3224.2373046875
    'sbg:y': 2721.7265625
  - id: base_quality_recalibration
    in:
      - id: input
        source: indel_realignment/indel_realignment_bam
      - id: reference
        source: reference_sequence
      - id: read_filter
        source:
          - gatk_bqsr_read_filter
      - id: known_sites
        source:
          - gatk_base_recalibrator_known_sites
      - id: base_recalibrator_output_file_name
        source: base_recalibrator_output_file_name
      - id: disable_read_filter
        source:
          - gatk_bqsr_disable_read_filter
      - id: apply_bqsr_create_output_bam_index
        source: create_bam_index
      - id: apply_bqsr_output_file_name
        source: apply_bqsr_output_file_name
    out:
      - id: gatk_apply_bqsr_bam
    run: subworkflows/base_quality_recalibration/base_quality_recalibration.cwl
    label: base_quality_recalibration
    'sbg:x': 3820.9423828125
    'sbg:y': 2775.09375
  - id: gatk_collect_alignment_summary_metrics_4_1_8_0
    in:
      - id: input
        source: base_quality_recalibration/gatk_apply_bqsr_bam
      - id: reference
        source: reference_sequence
    out:
      - id: gatk_collect_alignment_summary_metrics_txt
    run: >-
      command_line_tools/gatk_collect_alignment_summary_metrics_4.1.8.0/gatk_collect_alignment_summary_metrics_4.1.8.0.cwl
    label: GATK-CollectAlignmentSummaryMetrics
    'sbg:x': 4307.7060546875
    'sbg:y': 2775.09375
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
    out:
      - id: gatk_merge_sam_files_bam
    run: >-
      command_line_tools/gatk_merge_sam_files_4.1.8.0/gatk_merge_sam_files_4.1.8.0.cwl
    label: GATK-MergeSamFiles
    'sbg:x': 1025.4927978515625
    'sbg:y': 2693.7265625
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
