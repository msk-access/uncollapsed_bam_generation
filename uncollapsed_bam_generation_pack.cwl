{
    "$graph": [
        {
            "class": "CommandLineTool",
            "id": "#fastp_0.20.1.cwl",
            "baseCommand": [
                "fastp"
            ],
            "inputs": [
                {
                    "id": "#fastp_0.20.1.cwl/read1_input",
                    "type": "File",
                    "inputBinding": {
                        "prefix": "--in1"
                    },
                    "doc": "read1 input file name\n"
                },
                {
                    "id": "#fastp_0.20.1.cwl/read1_output_path",
                    "type": "string",
                    "inputBinding": {
                        "prefix": "--out1"
                    },
                    "doc": "read1 output file name\n"
                },
                {
                    "id": "#fastp_0.20.1.cwl/read2_input",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "prefix": "--in2"
                    },
                    "doc": "read2 input file name, for PE data\n"
                },
                {
                    "id": "#fastp_0.20.1.cwl/read2_output_path",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "prefix": "--out2"
                    },
                    "doc": "read2 output file name\n"
                },
                {
                    "id": "#fastp_0.20.1.cwl/unpaired1_path",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "prefix": "--unpaired1"
                    },
                    "doc": "for PE input, if read1 passed QC but read2 not, it will be written to unpaired1. \n"
                },
                {
                    "id": "#fastp_0.20.1.cwl/unpaired2_path",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "prefix": "--unpaired2"
                    },
                    "doc": "for PE input, if read2 passed QC but read1 not, it will be written to unpaired2.\n"
                },
                {
                    "id": "#fastp_0.20.1.cwl/failed_reads_path",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "prefix": "--failed_out"
                    },
                    "doc": "specify the file to store reads that cannot pass the filters.\n"
                },
                {
                    "id": "#fastp_0.20.1.cwl/read1_adapter_sequence",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "prefix": "--adapter_sequence"
                    },
                    "doc": "the adapter for read1. For SE data, if not specified, the adapter will be auto-detected. For PE data, this is used if R1/R2 are found not overlapped.\n"
                },
                {
                    "id": "#fastp_0.20.1.cwl/read2_adapter_sequence",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "prefix": "--adapter_sequence_r2"
                    },
                    "doc": "the adapter for read2. For PE data, this is used if R1/R2 are found not overlapped.\n"
                },
                {
                    "id": "#fastp_0.20.1.cwl/minimum_read_length",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "prefix": "--length_required"
                    },
                    "doc": "reads shorter than length_required will be discarded, default is 15.\n"
                },
                {
                    "id": "#fastp_0.20.1.cwl/json_output_path",
                    "type": "string",
                    "inputBinding": {
                        "prefix": "--json"
                    },
                    "doc": "the json format report file name\n",
                    "default": "fastp.json"
                },
                {
                    "id": "#fastp_0.20.1.cwl/html_output_path",
                    "type": "string",
                    "default": "fastp.html",
                    "inputBinding": {
                        "prefix": "--html"
                    },
                    "doc": "the html format report file name\n"
                }
            ],
            "outputs": [
                {
                    "id": "#fastp_0.20.1.cwl/fastp_json_output",
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.json_output_path)"
                    }
                },
                {
                    "id": "#fastp_0.20.1.cwl/fastp_html_output",
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.html_output_path)"
                    }
                },
                {
                    "id": "#fastp_0.20.1.cwl/fastp_read1_output",
                    "type": "File",
                    "outputBinding": {
                        "glob": "$(inputs.read1_output_path)"
                    }
                },
                {
                    "id": "#fastp_0.20.1.cwl/fastp_read2_output",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "$(inputs.read2_output_path)"
                    }
                },
                {
                    "id": "#fastp_0.20.1.cwl/fastp_unpaired1_output",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "$(inputs.unpaired1_path)"
                    }
                },
                {
                    "id": "#fastp_0.20.1.cwl/fastp_unpaired2_output",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "$(inputs.unpaired2_path)"
                    }
                }
            ],
            "doc": "Setup and execute Fastp",
            "label": "fastp_0.20.1",
            "requirements": [
                {
                    "class": "DockerRequirement",
                    "dockerPull": "quay.io/biocontainers/fastp:0.20.1--h8b12597_0"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:murphyc4@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Charlie Murphy"
                        },
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:fraihaa@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Adrian Fraiha"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:shahr2@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Ronak Shah"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "fastp",
                    "http://usefulinc.com/ns/doap#revision": "0.20.1"
                }
            ],
            "$namespaces": {
                "s": "https://schema.org/",
                "sbg": "https://www.sevenbridges.com/"
            }
        },
        {
            "class": "CommandLineTool",
            "id": "#fgbio_fastq_to_bam_1.2.0.cwl",
            "baseCommand": [
                "fgbio"
            ],
            "inputs": [
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory per job in megabytes"
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory overhead per job in megabytes"
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/input",
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--input",
                        "itemSeparator": " ",
                        "shellQuote": false
                    },
                    "label": "PathToFastq",
                    "doc": "Fastq files corresponding to each sequencing read (e.g. R1, I1, etc.)."
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "The output SAM or BAM file to be written."
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/read-structures",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "string"
                        }
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--read-structures",
                        "itemSeparator": " ",
                        "shellQuote": false
                    },
                    "doc": "Read structures, one for each of the FASTQs. https://github.com/fulcrumgenomics/fgbio/wiki/Read-Structures"
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/sort",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--sort",
                        "shellQuote": false
                    },
                    "doc": "If true, queryname sort the BAM file, otherwise preserve input order."
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/umi-tag",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--umi-tag",
                        "shellQuote": false
                    },
                    "doc": "Tag in which to store molecular barcodes/UMIs"
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/read-group-id",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--read-group-id",
                        "shellQuote": false
                    },
                    "doc": "Read group ID to use in the file header."
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/sample",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--sample",
                        "shellQuote": false
                    },
                    "doc": "The name of the sequenced sample."
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/library",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--library",
                        "shellQuote": false
                    },
                    "doc": "The name/ID of the sequenced library."
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/platform",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--platform",
                        "shellQuote": false
                    },
                    "doc": "Sequencing Platform"
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/platform-unit",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--platform-unit",
                        "shellQuote": false
                    },
                    "doc": "Platform unit (e.g. \u2018..')"
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/platform-model",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--platform-model",
                        "shellQuote": false
                    },
                    "doc": "Platform model to insert into the group header (ex. miseq, hiseq2500, hiseqX)"
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/sequencing-center",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--sequencing-center",
                        "shellQuote": false
                    },
                    "doc": "The sequencing center from which the data originated"
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/predicted-insert-size",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--predicted-insert-size",
                        "shellQuote": false
                    },
                    "doc": "Predicted median insert size, to insert into the read group header"
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/description",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--description"
                    },
                    "doc": "Description of the read group."
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/comment",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--comment"
                    },
                    "doc": "Comment(s) to include in the output file\u2019s header"
                },
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/run-date",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--run-date",
                        "shellQuote": false
                    },
                    "doc": "Date the run was produced, to insert into the read group header"
                }
            ],
            "outputs": [
                {
                    "id": "#fgbio_fastq_to_bam_1.2.0.cwl/fgbio_fastq_to_bam_ubam",
                    "type": "File",
                    "outputBinding": {
                        "glob": "${\n    if(inputs.output_file_name)\n        return inputs.output_file_name;\n    return  inputs.input[0].basename.replace(/.fastq.gz/,'_ubam.bam');\n}"
                    }
                }
            ],
            "doc": "Generates an unmapped BAM (or SAM or CRAM) file from fastq files. Takes in one or more fastq files (optionally gzipped), each representing a different sequencing read (e.g. R1, R2, I1 or I2) and can use a set of read structures to allocate bases in those reads to template reads, sample indices, unique molecular indices, or to designate bases to be skipped over.\n\nRead structures are made up of <number><operator> pairs much like the CIGAR string in BAM files. Four kinds of operators are recognized:\n\n1. T identifies a template read\n2. B identifies a sample barcode read\n3. M identifies a unique molecular index read\n4. S identifies a set of bases that should be skipped or ignored\n\nThe last <number><operator> pair may be specified using a + sign instead of number to denote \u201call remaining bases\u201d. This is useful if, e.g., fastqs have been trimmed and contain reads of varying length. For example to convert a paired-end run with an index read and where the first 5 bases of R1 are a UMI and the second five bases are monotemplate you might specify:",
            "label": "fgbio_fastq_to_bam_1.2.0",
            "arguments": [
                {
                    "position": 0,
                    "valueFrom": "${\n  if(inputs.memory_per_job && inputs.memory_overhead) {\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if (inputs.memory_per_job && !inputs.memory_overhead){\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if(!inputs.memory_per_job && inputs.memory_overhead){\n    return \"-Xmx4G\"\n  }\n  else {\n      return \"-Xmx4G\"\n  }\n}"
                },
                {
                    "position": 0,
                    "valueFrom": "-XX:-UseGCOverheadLimit"
                },
                {
                    "position": 0,
                    "prefix": "-Djava.io.tmpdir=",
                    "separate": false,
                    "shellQuote": false,
                    "valueFrom": "${ return runtime.tmpdir}"
                },
                {
                    "position": 0,
                    "valueFrom": "FastqToBam"
                },
                {
                    "position": 0,
                    "prefix": "--output",
                    "shellQuote": false,
                    "valueFrom": "${\n    if(inputs.output_file_name)\n        return inputs.output_file_name;\n      return  inputs.input[0].basename.replace(/.fastq.gz/,'_ubam.bam');\n}"
                }
            ],
            "requirements": [
                {
                    "class": "ShellCommandRequirement"
                },
                {
                    "class": "ResourceRequirement",
                    "ramMin": 10000,
                    "coresMin": 2
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "quay.io/biocontainers/fgbio:1.2.0--0"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:shahr2@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Ronak Shah"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:shahr2@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Ronak Shah"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "fgbio FastqToBam",
                    "http://usefulinc.com/ns/doap#revision": "1.2.0"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl",
            "baseCommand": [
                "gatk",
                "CollectAlignmentSummaryMetrics"
            ],
            "inputs": [
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory per job in megabytes"
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory overhead per job in megabytes"
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/input",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-I"
                    },
                    "doc": "Input file (bam or sam).  Required."
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "File to write the output to.  Required."
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/reference",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-R"
                    },
                    "doc": "Reference sequence file. Note that while this argument is not required, without it only a small subset of the metrics will be calculated. Note also that if a reference sequence is provided, it must be accompanied by a sequence dictionary.  Default value: null.",
                    "secondaryFiles": [
                        "^.fasta.fai",
                        "^.dict"
                    ]
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/adaptor_sequence",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ADAPTER_SEQUENCE"
                    },
                    "doc": "List of adapter sequences to use when processing the alignment metrics.  This argument may be specified 0 or more times. Default value: [AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT, AGATCGGAAGAGCTCGTATGCCGTCTTCTGCTTG, AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT, AGATCGGAAGAGCGGTTCAGCAGGAATGCCGAGACCGATCTCGTATGCCGTCTTCTGCTTG, AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT, AGATCGGAAGAGCACACGTCTGAACTCCAGTCACNNNNNNNNATCTCGTATGCCGTCTTCTGCTTG]."
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/metrics_acciumulation_level",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--METRIC_ACCUMULATION_LEVEL"
                    },
                    "doc": "The level(s) at which to accumulate metrics. Default value: [ALL_READS]. This option can be set to 'null' to clear the default value. Possible values: {ALL_READS, SAMPLE, LIBRARY, READ_GROUP} This option may be specified 0 or more times. This option can be set to 'null' to clear the default list."
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/expected_pair_orientations",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--EXPECTED_PAIR_ORIENTATIONS"
                    },
                    "doc": "Paired-end reads that do not have this expected orientation will be considered chimeric. This argument may be specified 0 or more times. Default value: [FR]. Possible values: {FR, RF, TANDEM}"
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/is_bisulfite_sequenced",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--IS_BISULFITE_SEQUENCED"
                    },
                    "doc": "Whether the SAM or BAM file consists of bisulfite sequenced reads.  Default value: false. Possible values: {true, false}"
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/max_insert_size",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--MAX_INSERT_SIZE"
                    },
                    "doc": "Paired-end reads above this insert size will be considered chimeric along with inter-chromosomal pairs.  Default value: 100000."
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/validation_stringency",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--VALIDATION_STRINGENCY"
                    },
                    "doc": "Validation stringency for all SAM files read by this program.  Setting stringency to SILENT can improve performance when processing a BAM file in which variable-length data (read, qualities, tags) do not otherwise need to be decoded.  Default value: STRICT. This option can be set to 'null' to clear the default value. Possible values: {STRICT,LENIENT, SILENT}"
                },
                {
                    "default": true,
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/assume_sorted",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ASSUME_SORTED"
                    },
                    "doc": "If true (default), then the sort order in the header file will be ignored.  Default value: true. This option can be set to 'null' to clear the default value. Possible values: {true, false}"
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/stop_after",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--STOP_AFTER"
                    },
                    "doc": "Stop after processing N reads, mainly for debugging. Default value: 0. This option can be set to 'null' to clear the default value."
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/create_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CREATE_INDEX"
                    },
                    "doc": "Whether to create a BAM index when writing a coordinate-sorted BAM file.  Default value: false. Possible values: {true, false}"
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/create_md5_file",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CREATE_MD5_FILE"
                    },
                    "doc": "Whether to create an MD5 digest for any BAM or FASTQ files created.    Default value: false. Possible values: {true, false}"
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/use_jdk_deflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--USE_JDK_DEFLATER"
                    },
                    "doc": "Use the JDK Deflater instead of the Intel Deflater for writing compressed output"
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/use_jdk_inflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--USE_JDK_INFLATER"
                    },
                    "doc": "Use the JDK Inflater instead of the Intel Inflater for reading compressed input"
                }
            ],
            "outputs": [
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl/gatk_collect_alignment_summary_metrics_txt",
                    "type": "File",
                    "outputBinding": {
                        "glob": "${\n    if (inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return inputs.input.basename.replace(/.bam/, '_alignment_summary_metrics.txt')\n    }\n}"
                    }
                }
            ],
            "label": "GATK-CollectAlignmentSummaryMetrics",
            "arguments": [
                {
                    "position": 0,
                    "prefix": "--java-options",
                    "valueFrom": "${\n  if(inputs.memory_per_job && inputs.memory_overhead) {\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if (inputs.memory_per_job && !inputs.memory_overhead){\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if(!inputs.memory_per_job && inputs.memory_overhead){\n    return \"-Xmx15G\"\n  }\n  else {\n      return \"-Xmx15G\"\n  }\n}"
                },
                {
                    "position": 0,
                    "prefix": "--TMP_DIR",
                    "valueFrom": "$(runtime.tmpdir)"
                },
                {
                    "position": 0,
                    "prefix": "--COMPRESSION_LEVEL",
                    "valueFrom": "2"
                },
                {
                    "position": 0,
                    "prefix": "--MAX_RECORDS_IN_RAM",
                    "valueFrom": "50000"
                },
                {
                    "position": 2,
                    "prefix": "-O",
                    "valueFrom": "${\n    if(inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return inputs.input.basename.replace(/.bam/, '_alignment_summary_metrics.txt')\n    }\n}"
                }
            ],
            "requirements": [
                {
                    "class": "ResourceRequirement",
                    "ramMin": 32000,
                    "coresMin": 1
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "broadinstitute/gatk:4.1.8.0"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:murphyc4@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Charles Murphy"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:murphyc4@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Charles Murphy"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "gatk4",
                    "http://usefulinc.com/ns/doap#revision": "4.1.8.0"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl",
            "baseCommand": [
                "gatk",
                "MergeBamAlignment"
            ],
            "inputs": [
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory per job in megabytes"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory overhead per job in megabytes"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/unmapped_bam",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--UNMAPPED_BAM"
                    },
                    "doc": "Original SAM or BAM file of unmapped reads, which must be in queryname order.  Reads MUST\nbe unmapped. Required.\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/reference",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--REFERENCE_SEQUENCE"
                    },
                    "doc": "Reference sequence file.  Required.\n",
                    "secondaryFiles": [
                        "^.dict"
                    ]
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "Merged SAM or BAM file to write to.  Required.\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/add_mate_cigar",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ADD_MATE_CIGAR"
                    },
                    "doc": "Adds the mate CIGAR tag (MC) if true, does not if false.  Default value: true. Possible\nvalues: {true, false}\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/add_pg_tag_to_reads",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ADD_PG_TAG_TO_READS"
                    },
                    "doc": "Add PG tag to each read in a SAM or BAM  Default value: true. Possible values: {true,\nfalse}\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/aligned_bam",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "File",
                            "inputBinding": {
                                "prefix": "--ALIGNED_BAM"
                            }
                        }
                    ],
                    "inputBinding": {
                        "position": 1
                    },
                    "doc": "SAM or BAM file(s) with alignment data.  This argument may be specified 0 or more times.\nDefault value: null.  Cannot be used in conjunction with argument(s) READ1_ALIGNED_BAM\n(R1_ALIGNED) READ2_ALIGNED_BAM (R2_ALIGNED)\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/aligned_reads_only",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ALIGNED_READS_ONLY"
                    },
                    "doc": "Whether to output only aligned reads. Default value: false. Possible values: {true,\nfalse}\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/aligner_proper_pair_flags",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ALIGNER_PROPER_PAIR_FLAGS"
                    },
                    "doc": "Use the aligners idea of what a proper pair is rather than computing in this program.\nDefault value: false. Possible values: {true, false}\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/attributes_to_remove",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ATTRIBUTES_TO_REMOVE"
                    },
                    "doc": "Attributes from the alignment record that should be removed when merging.  This overrides\nATTRIBUTES_TO_RETAIN if they share common tags.  This argument may be specified 0 or more\ntimes. Default value: null.\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/attributes_to_retain",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ATTRIBUTES_TO_RETAIN"
                    },
                    "doc": "Reserved alignment attributes (tags starting with X, Y, or Z) that should be brought over\nfrom the alignment data when merging.  This argument may be specified 0 or more times.\nDefault value: null.\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/attributes_to_reverse",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ATTRIBUTES_TO_REVERSE"
                    },
                    "doc": "Attributes on negative strand reads that need to be reversed.  This argument may be\nspecified 0 or more times. Default value: [OQ, U2].\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/attributes_to_reverse_complement",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ATTRIBUTES_TO_REVERSE_COMPLEMENT"
                    },
                    "doc": "Attributes on negative strand reads that need to be reverse complemented.  This argument\nmay be specified 0 or more times. Default value: [E2, SQ].\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/clip_adapters",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CLIP_ADAPTERS"
                    },
                    "doc": "Whether to clip adapters where identified.  Default value: true. Possible values: {true,\nfalse}\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/clip_overlapping_reads",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CLIP_OVERLAPPING_READS"
                    },
                    "doc": "For paired reads, clip the 3' end of each read if necessary so that it does not extend\npast the 5' end of its mate.  Clipping will be either soft or hard clipping, depending on\nCLIP_OVERLAPPING_READS_OPERATOR setting. Hard clipped bases and their qualities will be\nstored in the XB and XQ tags respectively.  Default value: true. Possible values: {true,\nfalse}\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/expected_orientations",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--EXPECTED_ORIENTATIONS"
                    },
                    "doc": "The expected orientation of proper read pairs. Replaces JUMP_SIZE  This argument may be\nspecified 0 or more times. Default value: null. Possible values: {FR, RF, TANDEM}  Cannot\nbe used in conjunction with argument(s) JUMP_SIZE (JUMP)\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/hard_clip_overlapping_reads",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--HARD_CLIP_OVERLAPPING_READS"
                    },
                    "doc": "If true, hard clipping will be applied to overlapping reads.  By default, soft clipping is\nused.  Default value: false. Possible values: {true, false}\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/include_secondary_alignments",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--INCLUDE_SECONDARY_ALIGNMENTS"
                    },
                    "doc": "If false, do not write secondary alignments to output.  Default value: true. Possible\nvalues: {true, false}\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/is_bisulfite_sequence",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--IS_BISULFITE_SEQUENCE"
                    },
                    "doc": "Whether the lane is bisulfite sequence (used when calculating the NM tag).  Default value:\nfalse. Possible values: {true, false}\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/jump_size",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--JUMP_SIZE"
                    },
                    "doc": "The expected jump size (required if this is a jumping library). Deprecated. Use\nEXPECTED_ORIENTATIONS instead  Default value: null.  Cannot be used in conjunction with\nargument(s) EXPECTED_ORIENTATIONS (ORIENTATIONS)\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/matching_dictionary_tags",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--MATCHING_DICTIONARY_TAGS"
                    },
                    "doc": "List of Sequence Records tags that must be equal (if present) in the reference dictionary\nand in the aligned file. Mismatching tags will cause an error if in this list, and a\nwarning otherwise.  This argument may be specified 0 or more times. Default value: [M5,\nLN].\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/max_insertions_or_deletions",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--MAX_INSERTIONS_OR_DELETIONS"
                    },
                    "doc": "The maximum number of insertions or deletions permitted for an alignment to be included.\nAlignments with more than this many insertions or deletions will be ignored. Set to -1 to\nallow any number of insertions or deletions.  Default value: 1.\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/min_unclipped_bases",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--MIN_UNCLIPPED_BASES"
                    },
                    "doc": "If UNMAP_CONTAMINANT_READS is set, require this many unclipped bases or else the read will\nbe marked as contaminant.  Default value: 32.\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/paired_run",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--PAIRED_RUN"
                    },
                    "doc": "DEPRECATED. This argument is ignored and will be removed.  Default value: true. Possible\nvalues: {true, false}\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/primary_alignment_strategy",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--PRIMARY_ALIGNMENT_STRATEGY"
                    },
                    "doc": "Strategy for selecting primary alignment when the aligner has provided more than one\nalignment for a pair or fragment, and none are marked as primary, more than one is marked\nas primary, or the primary alignment is filtered out for some reason. For all strategies,\nties are resolved arbitrarily.  Default value: BestMapq. BestMapq (Expects that multiple\nalignments will be correlated with HI tag, and prefers the pair of alignments with the\nlargest MAPQ, in the absence of a primary selected by the aligner.)\nEarliestFragment (Prefers the alignment which maps the earliest base in the read. Note\nthat EarliestFragment may not be used for paired reads.)\nBestEndMapq (Appropriate for cases in which the aligner is not pair-aware, and does not\noutput the HI tag. It simply picks the alignment for each end with the highest MAPQ, and\nmakes those alignments primary, regardless of whether the two alignments make sense\ntogether.)\nMostDistant (Appropriate for a non-pair-aware aligner. Picks the alignment pair with the\nlargest insert size. If all alignments would be chimeric, it picks the alignments for each\nend with the best MAPQ.)\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/read1_aligned_bam",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "File",
                            "inputBinding": {
                                "prefix": "--READ1_ALIGNED_BAM"
                            }
                        }
                    ],
                    "inputBinding": {
                        "position": 1
                    },
                    "doc": "SAM or BAM file(s) with alignment data from the first read of a pair.  This argument may\nbe specified 0 or more times. Default value: null.  Cannot be used in conjunction with\nargument(s) ALIGNED_BAM (ALIGNED)\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/read1_trim",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--READ1_TRIM"
                    },
                    "doc": "The number of bases trimmed from the beginning of read 1 prior to alignment  Default\nvalue: 0.\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/read2_aligned_bam",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "File",
                            "inputBinding": {
                                "prefix": "--READ2_ALIGNED_BAM"
                            }
                        }
                    ],
                    "inputBinding": {
                        "position": 1
                    },
                    "doc": "SAM or BAM file(s) with alignment data from the second read of a pair.  This argument may\nbe specified 0 or more times. Default value: null.  Cannot be used in conjunction with\nargument(s) ALIGNED_BAM (ALIGNED)\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/read2_trim",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--READ2_TRIM"
                    },
                    "doc": "The number of bases trimmed from the beginning of read 2 prior to alignment  Default\nvalue: 0.\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/sort_order",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--SORT_ORDER"
                    },
                    "doc": "The order in which the merged reads should be output.  Default value: coordinate. Possible\nvalues: {unsorted, queryname, coordinate, duplicate, unknown}\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/unmap_contaminant_reads",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--UNMAP_CONTAMINANT_READS"
                    },
                    "doc": "Detect reads originating from foreign organisms (e.g. bacterial DNA in a non-bacterial\nsample),and unmap + label those reads accordingly.  Default value: false. Possible values:\n{true, false}\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/unmapped_read_strategy",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--UNMAPPED_READ_STRATEGY"
                    },
                    "doc": "How to deal with alignment information in reads that are being unmapped (e.g. due to\ncross-species contamination.) Currently ignored unless UNMAP_CONTAMINANT_READS = true.\nNote that the DO_NOT_CHANGE strategy will actually reset the cigar and set the mapping\nquality on unmapped reads since otherwisethe result will be an invalid record. To force no\nchange use the DO_NOT_CHANGE_INVALID strategy.  Default value: DO_NOT_CHANGE. Possible\nvalues: {COPY_TO_TAG, DO_NOT_CHANGE, DO_NOT_CHANGE_INVALID, MOVE_TO_TAG}\n"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/validation_stringency",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--VALIDATION_STRINGENCY"
                    },
                    "doc": "Validation stringency for all SAM files read by this program.  Setting stringency to SILENT can improve performance when processing a BAM file in which variable-length data (read, qualities, tags) do not otherwise need to be decoded.  Default value: STRICT. This option can be set to 'null' to clear the default value. Possible values: {STRICT,LENIENT, SILENT}"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/create_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CREATE_INDEX"
                    },
                    "doc": "Whether to create a BAM index when writing a coordinate-sorted BAM file.  Default value: false. Possible values: {true, false}"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/create_md5_file",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CREATE_MD5_FILE"
                    },
                    "doc": "Whether to create an MD5 digest for any BAM or FASTQ files created.    Default value: false. Possible values: {true, false}"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/use_jdk_deflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--USE_JDK_DEFLATER"
                    },
                    "doc": "Use the JDK Deflater instead of the Intel Deflater for writing compressed output"
                },
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/use_jdk_inflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--USE_JDK_INFLATER"
                    },
                    "doc": "Use the JDK Inflater instead of the Intel Inflater for reading compressed input"
                }
            ],
            "outputs": [
                {
                    "id": "#gatk_merge_bam_alignment_4.1.8.0.cwl/gatk_merge_bam_alignment_bam",
                    "type": "File",
                    "outputBinding": {
                        "glob": "${\n    if(inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return inputs.unmapped_bam.basename.replace(/.bam|.sam/, '_merged.bam')\n    }\n}"
                    }
                }
            ],
            "label": "GATK-MergeBamAlignment",
            "arguments": [
                {
                    "position": 0,
                    "prefix": "--java-options",
                    "valueFrom": "${\n  if(inputs.memory_per_job && inputs.memory_overhead) {\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if (inputs.memory_per_job && !inputs.memory_overhead){\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if(!inputs.memory_per_job && inputs.memory_overhead){\n    return \"-Xmx15G\"\n  }\n  else {\n      return \"-Xmx15G\"\n  }\n}"
                },
                {
                    "position": 1,
                    "prefix": "-O",
                    "valueFrom": "${\n    if(inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return inputs.unmapped_bam.basename.replace(/.bam|.sam/, '_merged.bam')\n    }\n}"
                },
                {
                    "position": 0,
                    "prefix": "--TMP_DIR",
                    "valueFrom": "$(runtime.tmpdir)"
                },
                {
                    "position": 0,
                    "prefix": "--COMPRESSION_LEVEL",
                    "valueFrom": "2"
                },
                {
                    "position": 0,
                    "prefix": "--MAX_RECORDS_IN_RAM",
                    "valueFrom": "50000"
                }
            ],
            "requirements": [
                {
                    "class": "ResourceRequirement",
                    "ramMin": 12000,
                    "coresMin": 2
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "broadinstitute/gatk:4.1.8.0"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:murphyc4@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Charles Murphy"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:murphyc4@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Charles Murphy"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "gatk4",
                    "http://usefulinc.com/ns/doap#revision": "4.1.8.0"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#gatk_merge_sam_files_4.1.8.0.cwl",
            "baseCommand": [
                "gatk",
                "MergeSamFiles"
            ],
            "inputs": [
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory per job in megabytes"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory overhead per job in megabytes"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/input",
                    "type": {
                        "type": "array",
                        "items": "File",
                        "inputBinding": {
                            "prefix": "-I"
                        }
                    },
                    "inputBinding": {
                        "position": 1
                    },
                    "doc": "SAM or BAM input file  This argument must be specified at least once. Required.\n"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "SAM or BAM file to write merged result to  Required."
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/assume_sorted",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--ASSUME_SORTED"
                    },
                    "doc": "If true, assume that the input files are in the same sort order as the requested output\nsort order, even if their headers say otherwise.  Default value: false. Possible values:\n{true, false}\n"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/comment",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--COMMENT"
                    },
                    "doc": "Comment(s) to include in the merged output files header.  This argument may be specified\n0 or more times. Default value: null.\n"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/create_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--CREATE_INDEX"
                    },
                    "doc": "Whether to create a BAM index when writing a coordinate-sorted BAM file.  Default value:\nfalse. Possible values: {true, false}\n"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/create_md5_file",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--CREATE_MD5_FILE"
                    },
                    "doc": "Whether to create an MD5 digest for any BAM or FASTQ files created.    Default value:\nfalse. Possible values: {true, false}\n"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/intervals",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--INTERVALS"
                    },
                    "doc": "An interval list file that contains the locations of the positions to merge. Assume bam\nare sorted and indexed. The resulting file will contain alignments that may overlap with\ngenomic regions outside the requested region. Unmapped reads are discarded.  Default\nvalue: null.\n"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/merge_sequence_dictionaries",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--MERGE_SEQUENCE_DICTIONARIES"
                    },
                    "doc": "Merge the sequence dictionaries  Default value: false. Possible values: {true, false}\n"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/reference_sequence",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--REFERENCE_SEQUENCE"
                    },
                    "doc": "Reference sequence file.  Default value: null.\n"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/sort_order",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--SORT_ORDER"
                    },
                    "doc": "Sort order of output file  Default value: coordinate. Possible values: {unsorted,\nqueryname, coordinate, duplicate, unknown}\n"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/use_threading",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--USE_THREADING"
                    },
                    "doc": "Option to create a background thread to encode, compress and write to disk the output\nfile. The threaded version uses about 20% more CPU and decreases runtime by ~20% when\nwriting out a compressed BAM file.  Default value: false. Possible values: {true, false}\n"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/validation_stringency",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--VALIDATION_STRINGENCY"
                    },
                    "doc": "Validation stringency for all SAM files read by this program.  Setting stringency to\nSILENT can improve performance when processing a BAM file in which variable-length data\n(read, qualities, tags) do not otherwise need to be decoded.  Default value: STRICT.\nPossible values: {STRICT, LENIENT, SILENT}\n"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/verbosity",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 1,
                        "prefix": "--VERBOSITY"
                    },
                    "doc": "Control verbosity of logging.  Default value: INFO. Possible values: {ERROR, WARNING,\nINFO, DEBUG}\n"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/use_jdk_deflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--USE_JDK_DEFLATER"
                    },
                    "doc": "Use the JDK Deflater instead of the Intel Deflater for writing compressed output"
                },
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/use_jdk_inflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--USE_JDK_INFLATER"
                    },
                    "doc": "Use the JDK Inflater instead of the Intel Inflater for reading compressed input"
                }
            ],
            "outputs": [
                {
                    "id": "#gatk_merge_sam_files_4.1.8.0.cwl/gatk_merge_sam_files_bam",
                    "type": "File",
                    "outputBinding": {
                        "glob": "${\n    if(inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return 'merged.bam'\n    }\n}"
                    }
                }
            ],
            "label": "GATK-MergeSamFiles",
            "arguments": [
                {
                    "position": 0,
                    "prefix": "--java-options",
                    "valueFrom": "${\n  if(inputs.memory_per_job && inputs.memory_overhead) {\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if (inputs.memory_per_job && !inputs.memory_overhead){\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if(!inputs.memory_per_job && inputs.memory_overhead){\n    return \"-Xmx15G\"\n  }\n  else {\n      return \"-Xmx15G\"\n  }\n}"
                },
                {
                    "position": 0,
                    "prefix": "--TMP_DIR",
                    "valueFrom": "$(runtime.tmpdir)"
                },
                {
                    "position": 0,
                    "prefix": "--COMPRESSION_LEVEL",
                    "valueFrom": "2"
                },
                {
                    "position": 0,
                    "prefix": "--MAX_RECORDS_IN_RAM",
                    "valueFrom": "50000"
                },
                {
                    "position": 2,
                    "prefix": "-O",
                    "valueFrom": "${\n    if(inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return 'merged.bam'\n    }\n}"
                }
            ],
            "requirements": [
                {
                    "class": "ResourceRequirement",
                    "ramMin": 12000,
                    "coresMin": 2
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "broadinstitute/gatk:4.1.8.0"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:murphyc4@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Charles Murphy"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:murphyc4@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Charles Murphy"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "gatk4",
                    "http://usefulinc.com/ns/doap#revision": "4.1.8.0"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#gatk_sam_to_fastq_4.1.8.0.cwl",
            "baseCommand": [
                "gatk",
                "SamToFastq"
            ],
            "inputs": [
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory per job in megabytes"
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory overhead per job in megabytes"
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/fastq",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "Output FASTQ file (single-end fastq or, if paired, first end of the pair FASTQ)"
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/input",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--INPUT"
                    },
                    "doc": "Input SAM/BAM file to extract reads from  Required."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/clipping_action",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CLIPPING_ACTION"
                    },
                    "doc": "The action that should be taken with clipped reads: 'X' means the reads and qualities should be trimmed at the clipped position; 'N' means the bases should be changed to Ns in the clipped region; and any integer means that the base qualities should be set to that value in the clipped region.  Default value: null."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/clipping_attribute",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CLIPPING_ATTRIBUTE"
                    },
                    "doc": "The attribute that stores the position at which the SAM record should be clipped  Default value: null."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/clipping_min_length",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CLIPPING_MIN_LENGTH"
                    },
                    "doc": "When performing clipping with the CLIPPING_ATTRIBUTE and CLIPPING_ACTION parameters, ensure that the resulting reads after clipping are at least CLIPPING_MIN_LENGTH bases long. If the original read is shorter than CLIPPING_MIN_LENGTH then the original read length will be maintained.  Default value: 0."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/compress_outputs_per_rg",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--COMPRESS_OUTPUTS_PER_RG"
                    },
                    "doc": "Compress output FASTQ files per read group using gzip and append a .gz extension to the file names.  Default value: false. Possible values: {true, false}  Cannot be used in conjunction with argument(s) FASTQ (F) SECOND_END_FASTQ (F2) UNPAIRED_FASTQ (FU)"
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/compression_level",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--COMPRESSION_LEVEL"
                    },
                    "doc": "Compression level for all compressed files created (e.g. BAM and VCF).  Default value: 2."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/create_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CREATE_INDEX"
                    },
                    "doc": "Whether to create a BAM index when writing a coordinate-sorted BAM file.  Default value: false. Possible values: {true, false}"
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/include_non_pf_reads",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--INCLUDE_NON_PF_READS"
                    },
                    "doc": "Include non-PF reads from the SAM file into the output FASTQ files. PF means 'passes filtering'. Reads whose 'not passing quality controls' flag is set are non-PF reads. See GATK Dictionary for more info.  Default value: false. Possible values: {true, false}"
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/include_non_primary_alignments",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--INCLUDE_NON_PRIMARY_ALIGNMENTS"
                    },
                    "doc": "If true, include non-primary alignments in the output.  Support of non-primary alignments in SamToFastq is not comprehensive, so there may be exceptions if this is set to true and there are paired reads with non-primary alignments.  Default value: false. Possible values: {true, false}"
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/interleave",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--INTERLEAVE"
                    },
                    "doc": "Will generate an interleaved fastq if paired, each line will have /1 or /2 to describe which end it came from  Default value: false. Possible values: {true, false}"
                },
                {
                    "default": 50000,
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/max_records_in_ram",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--MAX_RECORDS_IN_RAM"
                    },
                    "doc": "When writing files that need to be sorted, this will specify the number of records stored in RAM before spilling to disk. Increasing this number reduces the number of file handles needed to sort the file, and increases the amount of RAM needed.  Default value: 500000."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/output_dir",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--OUTPUT_DIR"
                    },
                    "doc": "Directory in which to output the FASTQ file(s). Used only when OUTPUT_PER_RG is true. Default value: null. Cannot be used in conjunction with argument(s) FASTQ (F)."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/create_md5_file",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CREATE_MD5_FILE"
                    },
                    "doc": "Whether to create an MD5 digest for any BAM or FASTQ files created.    Default value: false. Possible values: {true, false}."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/output_per_rg",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--OUTPUT_PER_RG"
                    },
                    "doc": "Output a FASTQ file per read group (two FASTQ files per read group if the group is paired).  Default value: false. Possible values: {true, false}  Cannot be used in conjunction with argument(s) FASTQ (F) SECOND_END_FASTQ (F2) UNPAIRED_FASTQ (FU)"
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/quality",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--QUALITY"
                    },
                    "doc": "End-trim reads using the phred/bwa quality trimming algorithm and this quality. Default value: null."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/re_reverse",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--RE_REVERSE"
                    },
                    "doc": "Re-reverse bases and qualities of reads with negative strand flag set before writing them to FASTQ  Default value: true. Possible values: {true, false}"
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/read1_max_bases_to_write",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--READ1_MAX_BASES_TO_WRITE"
                    },
                    "doc": "The maximum number of bases to write from read 1 after trimming. If there are fewer than this many bases left after trimming, all will be written.  If this value is null then all bases left after trimming will be written.  Default value: null."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/read1_trim",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--READ1_TRIM"
                    },
                    "doc": "The number of bases to trim from the beginning of read 1.  Default value: 0."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/read2_max_bases_to_write",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--READ2_MAX_BASES_TO_WRITE"
                    },
                    "doc": "The maximum number of bases to write from read 2 after trimming. If there are fewer than this many bases left after trimming, all will be written.  If this value is null then all bases left after trimming will be written.  Default value: null."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/read2_trim",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--READ2_TRIM"
                    },
                    "doc": "The number of bases to trim from the beginning of read 2.  Default value: 0."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/reference_sequence",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--REFERENCE_SEQUENCE"
                    },
                    "doc": "Reference sequence file. Default value: null."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/rg_tag",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--RG_TAG"
                    },
                    "doc": "The read group tag (PU or ID) to be used to output a FASTQ file per read group.  Default value: PU."
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/second_end_fastq",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--SECOND_END_FASTQ"
                    },
                    "doc": "Output FASTQ file (if paired, second end of the pair FASTQ).  Default value: null.  Cannot be used in conjunction with argument(s) OUTPUT_PER_RG (OPRG) COMPRESS_OUTPUTS_PER_RG (GZOPRG)"
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/unpaired_fastq",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--UNPAIRED_FASTQ"
                    },
                    "doc": "Output FASTQ file for unpaired reads; may only be provided in paired-FASTQ mode  Default value: null.  Cannot be used in conjunction with argument(s) OUTPUT_PER_RG (OPRG) COMPRESS_OUTPUTS_PER_RG (GZOPRG)"
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/validation_stringency",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--VALIDATION_STRINGENCY"
                    },
                    "doc": "Validation stringency for all SAM files read by this program.  Setting stringency to SILENT can improve performance when processing a BAM file in which variable-length data (read, qualities, tags) do not otherwise need to be decoded.  Default value: STRICT. Possible values: {STRICT, LENIENT, SILENT}"
                }
            ],
            "outputs": [
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/gatk_sam_to_fastq_fastq",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "${\n    if(inputs.fastq){\n      return inputs.fastq\n    } else {\n      return inputs.input.basename.replace(/.bam|.sam/, '_R1.fastq')\n    }\n}"
                    }
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/gatk_sam_to_fastq_unpaired_fastq",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "${\n    if(inputs.unpaired_fastq){\n        return inputs.unpaired_fastq\n    } else {\n      return inputs.input.basename.replace(/.bam|.sam/, '_unpaired.fastq')\n    }\n}"
                    }
                },
                {
                    "id": "#gatk_sam_to_fastq_4.1.8.0.cwl/gatk_sam_to_fastq_second_end_fastq",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "${\n    if(inputs.second_end_fastq){\n        return inputs.second_end_fastq\n    } else {\n      return inputs.input.basename.replace(/.bam|.sam/, '_R2.fastq')\n    }\n}"
                    }
                }
            ],
            "label": "GATK-SamToFastq",
            "arguments": [
                {
                    "position": 0,
                    "prefix": "--java-options",
                    "valueFrom": "${\n  if(inputs.memory_per_job && inputs.memory_overhead) {\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if (inputs.memory_per_job && !inputs.memory_overhead){\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if(!inputs.memory_per_job && inputs.memory_overhead){\n    return \"-Xmx15G\"\n  }\n  else {\n      return \"-Xmx15G\"\n  }\n}"
                },
                {
                    "position": 0,
                    "prefix": "--TMP_DIR",
                    "valueFrom": "$(runtime.tmpdir)"
                },
                {
                    "position": 2,
                    "prefix": "--FASTQ",
                    "valueFrom": "${\n    if(inputs.fastq){\n        return inputs.fastq\n    } else {\n        return inputs.input.basename.replace(/.bam|.sam/, '_R1.fastq')\n    }\n}"
                }
            ],
            "requirements": [
                {
                    "class": "ResourceRequirement",
                    "ramMin": 8000,
                    "coresMin": 2
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "broadinstitute/gatk:4.1.8.0"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:murphyc4@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Charles Murphy"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:murphyc4@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Charles Murphy"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "gatk4",
                    "http://usefulinc.com/ns/doap#revision": "4.1.8.0"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#picard_mark_duplicates_4.1.8.1.cwl",
            "baseCommand": [
                "java"
            ],
            "inputs": [
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory per job in megabytes"
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory overhead per job in megabytes"
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/input",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-I"
                    },
                    "doc": "Input file (bam or sam).  Required."
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "Output file (bam or sam)."
                },
                {
                    "default": "$( inputs.input.basename.replace(/.bam/, '_md.metrics') )",
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/duplication_metrics",
                    "type": "string",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-M"
                    },
                    "doc": "File to write duplication metrics to Required."
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/assume_sort_order",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-ASO"
                    },
                    "doc": "Optional sort order to output in. If not supplied OUTPUT is in the same order as INPUT.Default value: null. Possible values: {unsorted, queryname, coordinate}"
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/tmp_dir",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--TMP_DIR"
                    },
                    "doc": "This option may be specified 0 or more times"
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/validation_stringency",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--VALIDATION_STRINGENCY"
                    },
                    "doc": "Validation stringency for all SAM files read by this program.  Setting stringency to SILENT can improve performance when processing a BAM file in which variable-length data (read, qualities, tags) do not otherwise need to be decoded.  Default value: STRICT. This option can be set to 'null' to clear the default value. Possible values: {STRICT,LENIENT, SILENT}"
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/bam_compression_level",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--COMPRESSION_LEVEL"
                    },
                    "doc": "Compression level for all compressed files created (e.g. BAM and GELI). Default value:5. This option can be set to 'null' to clear the default value."
                },
                {
                    "default": true,
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/create_bam_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CREATE_INDEX"
                    },
                    "doc": "Whether to create a BAM index when writing a coordinate-sorted BAM file. Default value:false. This option can be set to 'null' to clear the default value. Possible values:{true, false}"
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/read_name_regex",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--READ_NAME_REGEX"
                    },
                    "doc": "MarkDuplicates can use the tile and cluster positions to estimate the rate of optical duplication in addition to the dominant source of duplication, PCR, to provide a more accurate estimation of library size. By default (with no READ_NAME_REGEX specified), MarkDuplicates will attempt to extract coordinates using a split on ':' (see Note below). Set READ_NAME_REGEX to 'null' to disable optical duplicate detection. Note that without optical duplicate counts, library size estimation will be less accurate. If the read name does not follow a standard Illumina colon-separation convention, but does contain tile and x,y coordinates, a regular expression can be specified to extract three variables: tile/region, x coordinate and y coordinate from a read name. The regular expression must contain three capture groups for the three variables, in order. It must match the entire read name. e.g. if field names were separated by semi-colon (';') this example regex could be specified (?:.*;)?([0-9]+)[^;]*;([0-9]+)[^;]*;([0-9]+)[^;]*$ Note that if no READ_NAME_REGEX is specified, the read name is split on ':'. For 5 element names, the 3rd, 4th and 5th elements are assumed to be tile, x and y values. For 7 element names (CASAVA 1.8), the 5th, 6th, and 7th elements are assumed to be tile, x and y values."
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/sorting_collection_size_ratio",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--SORTING_COLLECTION_SIZE_RATIO"
                    },
                    "doc": "This number, plus the maximum RAM available to the JVM, determine the memory footprint used by some of the sorting collections. If you are running out of memory, try reducing this number."
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/use_jdk_deflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--USE_JDK_DEFLATER"
                    },
                    "doc": "Use the JDK Deflater instead of the Intel Deflater for writing compressed output"
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/use_jdk_inflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--USE_JDK_INFLATER"
                    },
                    "doc": "Use the JDK Inflater instead of the Intel Inflater for reading compressed input"
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/duplicate_scoring_strategy",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--DUPLICATE_SCORING_STRATEGY"
                    },
                    "doc": "The scoring strategy for choosing the non-duplicate among candidates. Default value:SUM_OF_BASE_QUALITIES. This option can be set to 'null' to clear the default value.Possible values: {SUM_OF_BASE_QUALITIES, TOTAL_MAPPED_REFERENCE_LENGTH, RANDOM}"
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/optical_duplicate_pixel_distance",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--OPTICAL_DUPLICATE_PIXEL_DISTANCE"
                    },
                    "doc": "The maximum offset between two duplicate clusters in order to consider them optical duplicates. The default is appropriate for unpatterned versions of the Illumina platform. For the patterned flowcell models, 2500 is moreappropriate. For other platforms and models, users should experiment to find what works best.  Default value: 100. This option can be set to 'null' to clear the default value."
                }
            ],
            "outputs": [
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/picard_mark_duplicates_bam",
                    "type": "File",
                    "outputBinding": {
                        "glob": "${\n    if(inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return inputs.input.basename.replace(/.bam/,'_md.bam')\n    }\n}"
                    },
                    "secondaryFiles": [
                        "^.bai"
                    ]
                },
                {
                    "id": "#picard_mark_duplicates_4.1.8.1.cwl/picard_mark_duplicates_metrics",
                    "type": "File",
                    "outputBinding": {
                        "glob": "${\n    if(inputs.duplication_metrics){\n        return inputs.duplication_metrics\n    } else {\n        return inputs.input.basename.replace(/.bam/,'_md.metrics')\n    }\n}"
                    }
                }
            ],
            "label": "picard_mark_duplicates_4.1.8.1",
            "arguments": [
                {
                    "position": 0,
                    "valueFrom": "${ if(inputs.memory_per_job && inputs.memory_overhead) { if(inputs.memory_per_job % 1000 == 0) { return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\" } else { return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" } } else if (inputs.memory_per_job && !inputs.memory_overhead){ if(inputs.memory_per_job % 1000 == 0) { return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\" } else { return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" } } else if(!inputs.memory_per_job && inputs.memory_overhead){ return \"-Xmx15G\" } else { return \"-Xmx15G\" } }"
                },
                {
                    "position": 0,
                    "prefix": "-jar",
                    "valueFrom": "/gatk/gatk-package-4.1.8.1-local.jar"
                },
                {
                    "position": 0,
                    "valueFrom": "MarkDuplicates"
                },
                {
                    "position": 0,
                    "prefix": "-O",
                    "valueFrom": "${\n    if(inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return inputs.input.basename.replace(/.bam/,'_md.bam')\n    }\n}"
                },
                {
                    "position": 0,
                    "prefix": "--TMP_DIR",
                    "valueFrom": "$(runtime.tmpdir)"
                }
            ],
            "requirements": [
                {
                    "class": "ResourceRequirement",
                    "ramMin": 17000,
                    "coresMin": 2
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "broadinstitute/gatk:4.1.8.1"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:kumarn1@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Nikhil Kumar"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:shahr2@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Ronak Shah"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "picard",
                    "http://usefulinc.com/ns/doap#revision": "4.1.8.1"
                }
            ]
        },
        {
            "class": "Workflow",
            "id": "#alignment.cwl",
            "label": "alignment",
            "inputs": [
                {
                    "id": "#alignment.cwl/create_bam_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 319.15625,
                    "https://www.sevenbridges.com/y": 852.0390625
                },
                {
                    "id": "#alignment.cwl/output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 319.15625,
                    "https://www.sevenbridges.com/y": 745.2109375
                },
                {
                    "id": "#alignment.cwl/read_group_description",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1388.765625
                },
                {
                    "id": "#alignment.cwl/read_group_identifier",
                    "type": "string",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1281.9375
                },
                {
                    "id": "#alignment.cwl/read_group_library",
                    "type": "string",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1175.109375
                },
                {
                    "id": "#alignment.cwl/read_group_platform_unit",
                    "type": "string",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1068.28125
                },
                {
                    "id": "#alignment.cwl/read_group_run_date",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 961.453125
                },
                {
                    "id": "#alignment.cwl/read_group_sample_name",
                    "type": "string",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 854.625
                },
                {
                    "id": "#alignment.cwl/read_group_sequencing_center",
                    "type": "string",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 747.796875
                },
                {
                    "id": "#alignment.cwl/read_group_sequencing_platform",
                    "type": "string",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 640.96875
                },
                {
                    "id": "#alignment.cwl/sort_order",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 320.484375
                },
                {
                    "id": "#alignment.cwl/validation_stringency",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 106.828125
                },
                {
                    "id": "#alignment.cwl/reference",
                    "type": "File",
                    "secondaryFiles": [
                        ".amb",
                        ".fai",
                        ".sa",
                        "^.dict",
                        ".ann",
                        ".bwt",
                        ".pac"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 427.3125
                },
                {
                    "id": "#alignment.cwl/reads",
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 534.140625
                },
                {
                    "id": "#alignment.cwl/output",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1602.421875
                },
                {
                    "id": "#alignment.cwl/P",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1495.59375
                },
                {
                    "id": "#alignment.cwl/M",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1709.25
                },
                {
                    "id": "#alignment.cwl/T",
                    "type": [
                        "null",
                        "int"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 213.65625
                },
                {
                    "id": "#alignment.cwl/Y",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 0
                },
                {
                    "id": "#alignment.cwl/K",
                    "type": [
                        "null",
                        "int"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1816.078125
                },
                {
                    "id": "#alignment.cwl/bwa_number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1922.90625
                }
            ],
            "outputs": [
                {
                    "id": "#alignment.cwl/picard_add_or_replace_read_groups_bam",
                    "outputSource": [
                        "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/picard_add_or_replace_read_groups_bam"
                    ],
                    "type": "File",
                    "secondaryFiles": [
                        "^.bai?"
                    ],
                    "https://www.sevenbridges.com/x": 1379.46142578125,
                    "https://www.sevenbridges.com/y": 961.453125
                }
            ],
            "steps": [
                {
                    "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1",
                    "in": [
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/input",
                            "source": "#alignment.cwl/bwa_mem_0_7_17/bwa_mem_output_sam"
                        },
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/output_file_name",
                            "source": "#alignment.cwl/output_file_name"
                        },
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/sort_order",
                            "source": "#alignment.cwl/sort_order"
                        },
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/read_group_identifier",
                            "source": "#alignment.cwl/read_group_identifier"
                        },
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/read_group_sequencing_center",
                            "source": "#alignment.cwl/read_group_sequencing_center"
                        },
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/read_group_library",
                            "source": "#alignment.cwl/read_group_library"
                        },
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/read_group_platform_unit",
                            "source": "#alignment.cwl/read_group_platform_unit"
                        },
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/read_group_sample_name",
                            "source": "#alignment.cwl/read_group_sample_name"
                        },
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/read_group_sequencing_platform",
                            "source": "#alignment.cwl/read_group_sequencing_platform"
                        },
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/read_group_description",
                            "source": "#alignment.cwl/read_group_description"
                        },
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/read_group_run_date",
                            "source": "#alignment.cwl/read_group_run_date"
                        },
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/validation_stringency",
                            "source": "#alignment.cwl/validation_stringency"
                        },
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/create_bam_index",
                            "source": "#alignment.cwl/create_bam_index"
                        }
                    ],
                    "out": [
                        {
                            "id": "#alignment.cwl/picard_add_or_replace_read_groups_4_1_8_1/picard_add_or_replace_read_groups_bam"
                        }
                    ],
                    "run": "#picard_add_or_replace_read_groups_4.1.8.1.cwl",
                    "label": "picard_add_or_replace_read_groups_4.1.8.1",
                    "https://www.sevenbridges.com/x": 737.3328857421875,
                    "https://www.sevenbridges.com/y": 870.453125
                },
                {
                    "id": "#alignment.cwl/bwa_mem_0_7_17",
                    "in": [
                        {
                            "id": "#alignment.cwl/bwa_mem_0_7_17/number_of_threads",
                            "source": "#alignment.cwl/bwa_number_of_threads"
                        },
                        {
                            "id": "#alignment.cwl/bwa_mem_0_7_17/reads",
                            "source": [
                                "#alignment.cwl/reads"
                            ]
                        },
                        {
                            "id": "#alignment.cwl/bwa_mem_0_7_17/reference",
                            "source": "#alignment.cwl/reference"
                        },
                        {
                            "id": "#alignment.cwl/bwa_mem_0_7_17/M",
                            "source": "#alignment.cwl/M"
                        },
                        {
                            "id": "#alignment.cwl/bwa_mem_0_7_17/P",
                            "source": "#alignment.cwl/P"
                        },
                        {
                            "id": "#alignment.cwl/bwa_mem_0_7_17/T",
                            "source": "#alignment.cwl/T"
                        },
                        {
                            "id": "#alignment.cwl/bwa_mem_0_7_17/K",
                            "source": "#alignment.cwl/K"
                        },
                        {
                            "id": "#alignment.cwl/bwa_mem_0_7_17/output",
                            "source": "#alignment.cwl/output"
                        },
                        {
                            "id": "#alignment.cwl/bwa_mem_0_7_17/Y",
                            "source": "#alignment.cwl/Y"
                        }
                    ],
                    "out": [
                        {
                            "id": "#alignment.cwl/bwa_mem_0_7_17/bwa_mem_output_sam"
                        }
                    ],
                    "run": "#bwa_mem_0.7.17.cwl",
                    "label": "bwa_mem_0.7.17",
                    "https://www.sevenbridges.com/x": 319.15625,
                    "https://www.sevenbridges.com/y": 1014.8671875
                }
            ],
            "requirements": [],
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:sumans@mskcc.org",
                    "https://schema.org/identifier": "",
                    "https://schema.org/name": "Shalabh Suman"
                },
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:johnsoni@mskcc.org",
                    "https://schema.org/identifier": "",
                    "https://schema.org/name": "Ian Jonhnson"
                }
            ],
            "https://schema.org/citation": "",
            "https://schema.org/codeRepository": "https://github.com/msk-access/cwl_subworkflows/alignment",
            "https://schema.org/contributor": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:johnsoni@mskcc.org",
                    "https://schema.org/identifier": "",
                    "https://schema.org/name": "Ian Jonhnson"
                },
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:shahr2@mskcc.org",
                    "https://schema.org/identifier": "https://orcid.org/0000-0001-9042-6213",
                    "https://schema.org/name": "Ronak Shah"
                },
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:sumans@mskcc.org",
                    "https://schema.org/identifier": "",
                    "https://schema.org/name": "Shalabh Suman"
                },
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:murphyc4@mskcc.org",
                    "https://schema.org/identifier": "",
                    "https://schema.org/name": "Charlie Murphy"
                }
            ],
            "https://schema.org/dateCreated": "2019-10-01",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0"
        },
        {
            "class": "Workflow",
            "id": "#base_quality_recalibration.cwl",
            "label": "base_quality_recalibration",
            "inputs": [
                {
                    "id": "#base_quality_recalibration.cwl/input",
                    "type": "File",
                    "secondaryFiles": [
                        "^.bai"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 427.4375
                },
                {
                    "id": "#base_quality_recalibration.cwl/reference",
                    "type": "File",
                    "secondaryFiles": [
                        ".fai",
                        "^.dict"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 0
                },
                {
                    "id": "#base_quality_recalibration.cwl/read_filter",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "string",
                            "inputBinding": {
                                "prefix": "--read-filter"
                            }
                        }
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 106.859375
                },
                {
                    "id": "#base_quality_recalibration.cwl/known_sites",
                    "type": {
                        "type": "array",
                        "items": "File",
                        "inputBinding": {
                            "prefix": "--known-sites"
                        }
                    },
                    "secondaryFiles": [
                        ".idx"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 320.578125
                },
                {
                    "id": "#base_quality_recalibration.cwl/base_recalibrator_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 641.15625
                },
                {
                    "id": "#base_quality_recalibration.cwl/add_output_sam_program_record",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 961.734375
                },
                {
                    "id": "#base_quality_recalibration.cwl/disable_read_filter",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "string",
                            "inputBinding": {
                                "prefix": "--disable-read-filter"
                            }
                        }
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 534.296875
                },
                {
                    "id": "#base_quality_recalibration.cwl/lenient",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 213.71875
                },
                {
                    "id": "#base_quality_recalibration.cwl/apply_bqsr_create_output_bam_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 854.875
                },
                {
                    "id": "#base_quality_recalibration.cwl/apply_bqsr_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 748.015625
                }
            ],
            "outputs": [
                {
                    "id": "#base_quality_recalibration.cwl/gatk_apply_bqsr_bam",
                    "outputSource": [
                        "#base_quality_recalibration.cwl/gatk_apply_bqsr_4_1_8_1/gatk_apply_bqsr_bam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ],
                    "secondaryFiles": [
                        "^.bai?"
                    ],
                    "https://www.sevenbridges.com/x": 1060.585205078125,
                    "https://www.sevenbridges.com/y": 772.228271484375
                }
            ],
            "steps": [
                {
                    "id": "#base_quality_recalibration.cwl/gatk_base_recalibrator_4_1_8_1",
                    "in": [
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_base_recalibrator_4_1_8_1/input",
                            "source": "#base_quality_recalibration.cwl/input"
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_base_recalibrator_4_1_8_1/known_sites",
                            "source": [
                                "#base_quality_recalibration.cwl/known_sites"
                            ]
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_base_recalibrator_4_1_8_1/reference",
                            "source": "#base_quality_recalibration.cwl/reference"
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_base_recalibrator_4_1_8_1/output_file_name",
                            "source": "#base_quality_recalibration.cwl/base_recalibrator_output_file_name"
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_base_recalibrator_4_1_8_1/add_output_sam_program_record",
                            "source": "#base_quality_recalibration.cwl/add_output_sam_program_record"
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_base_recalibrator_4_1_8_1/disable_read_filter",
                            "source": [
                                "#base_quality_recalibration.cwl/disable_read_filter"
                            ]
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_base_recalibrator_4_1_8_1/lenient",
                            "source": "#base_quality_recalibration.cwl/lenient"
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_base_recalibrator_4_1_8_1/read_filter",
                            "source": [
                                "#base_quality_recalibration.cwl/read_filter"
                            ]
                        }
                    ],
                    "out": [
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_base_recalibrator_4_1_8_1/gatk_base_recalibrator_output"
                        }
                    ],
                    "run": "#gatk_base_recalibrator_4.1.8.1.cwl",
                    "label": "gatk_base_recalibrator_4.1.8.1",
                    "https://www.sevenbridges.com/x": 356.59375,
                    "https://www.sevenbridges.com/y": 350.4375
                },
                {
                    "id": "#base_quality_recalibration.cwl/gatk_apply_bqsr_4_1_8_1",
                    "in": [
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_apply_bqsr_4_1_8_1/reference",
                            "source": "#base_quality_recalibration.cwl/reference"
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_apply_bqsr_4_1_8_1/create_output_bam_index",
                            "source": "#base_quality_recalibration.cwl/apply_bqsr_create_output_bam_index"
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_apply_bqsr_4_1_8_1/bqsr_recal_file",
                            "source": "#base_quality_recalibration.cwl/gatk_base_recalibrator_4_1_8_1/gatk_base_recalibrator_output"
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_apply_bqsr_4_1_8_1/input",
                            "source": "#base_quality_recalibration.cwl/input"
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_apply_bqsr_4_1_8_1/output_file_name",
                            "source": "#base_quality_recalibration.cwl/apply_bqsr_output_file_name"
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_apply_bqsr_4_1_8_1/disable_read_filter",
                            "source": [
                                "#base_quality_recalibration.cwl/disable_read_filter"
                            ]
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_apply_bqsr_4_1_8_1/lenient",
                            "source": "#base_quality_recalibration.cwl/lenient"
                        },
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_apply_bqsr_4_1_8_1/read_filter",
                            "source": [
                                "#base_quality_recalibration.cwl/read_filter"
                            ]
                        }
                    ],
                    "out": [
                        {
                            "id": "#base_quality_recalibration.cwl/gatk_apply_bqsr_4_1_8_1/gatk_apply_bqsr_bam"
                        }
                    ],
                    "run": "#gatk_apply_bqsr_4.1.8.1.cwl",
                    "label": "gatk_apply_bqsr_4.1.8.1",
                    "https://www.sevenbridges.com/x": 589.6504516601562,
                    "https://www.sevenbridges.com/y": 741.6892700195312
                }
            ],
            "requirements": [],
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:shahr2@mskcc.org",
                    "https://schema.org/identifier": "https://orcid.org/0000-0001-9042-6213",
                    "https://schema.org/name": "Ronak Shah"
                }
            ],
            "https://schema.org/citation": "",
            "https://schema.org/codeRepository": "https://github.com/msk-access/cwl_subworkflows/base_quality_recalibration",
            "https://schema.org/contributor": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:shahr2@mskcc.org",
                    "https://schema.org/identifier": "https://orcid.org/0000-0001-9042-6213",
                    "https://schema.org/name": "Ronak Shah"
                }
            ],
            "https://schema.org/dateCreated": "2020-06-09",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0"
        },
        {
            "class": "CommandLineTool",
            "id": "#abra2_2.22.cwl",
            "baseCommand": [
                "java"
            ],
            "inputs": [
                {
                    "id": "#abra2_2.22.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory per job in megabytes"
                },
                {
                    "id": "#abra2_2.22.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory overhead per job in megabytes"
                },
                {
                    "id": "#abra2_2.22.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--threads"
                    }
                },
                {
                    "id": "#abra2_2.22.cwl/input_bam",
                    "type": [
                        "File",
                        {
                            "type": "array",
                            "items": "File"
                        }
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--in"
                    },
                    "doc": "Required list of input sam or bam file (s) separated by comma",
                    "secondaryFiles": [
                        "^.bai"
                    ]
                },
                {
                    "id": "#abra2_2.22.cwl/working_directory",
                    "type": [
                        "null",
                        "Directory"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--tmpdir"
                    },
                    "doc": "Set the temp directory (overrides java.io.tmpdir)"
                },
                {
                    "id": "#abra2_2.22.cwl/reference_fasta",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ref"
                    },
                    "doc": "Genome reference location",
                    "secondaryFiles": [
                        ".fai"
                    ]
                },
                {
                    "id": "#abra2_2.22.cwl/targets",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--targets"
                    }
                },
                {
                    "id": "#abra2_2.22.cwl/kmer_size",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--kmer"
                    },
                    "doc": "Optional assembly kmer size(delimit with commas if multiple sizes specified)"
                },
                {
                    "id": "#abra2_2.22.cwl/maximum_average_depth",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--mad"
                    },
                    "doc": "Regions with average depth exceeding this value will be downsampled (default: 1000)"
                },
                {
                    "id": "#abra2_2.22.cwl/soft_clip_contig",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--sc"
                    },
                    "doc": "Soft clip contig args [max_contigs,min_base_qual,frac_high_qual_bases,min_soft_clip_len] (default:16,13,80,15)"
                },
                {
                    "id": "#abra2_2.22.cwl/maximum_mixmatch_rate",
                    "type": [
                        "null",
                        "float"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--mmr"
                    },
                    "doc": "Max allowed mismatch rate when mapping reads back to contigs (default: 0.05)"
                },
                {
                    "id": "#abra2_2.22.cwl/scoring_gap_alignments",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--sga"
                    },
                    "doc": "Scoring used for contig alignments(match, mismatch_penalty,gap_open_penalty,gap_extend_penalty) (default:8,32,48,1)"
                },
                {
                    "id": "#abra2_2.22.cwl/contig_anchor",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ca"
                    },
                    "doc": "Contig anchor [M_bases_at_contig_edge,max_mismatches_near_edge] (default:10,2)"
                },
                {
                    "id": "#abra2_2.22.cwl/window_size",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ws"
                    },
                    "doc": "Processing window size and overlap\n(size,overlap) (default: 400,200)"
                },
                {
                    "id": "#abra2_2.22.cwl/consensus_sequence",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--cons"
                    },
                    "doc": "Use positional consensus sequence when aligning high quality soft clipping"
                },
                {
                    "id": "#abra2_2.22.cwl/output_bams",
                    "type": [
                        "string",
                        {
                            "type": "array",
                            "items": "string"
                        }
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--out"
                    },
                    "doc": "Required list of output sam or bam file (s) separated by comma"
                },
                {
                    "id": "#abra2_2.22.cwl/ignore_bad_assembly",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--ignore-bad-assembly"
                    },
                    "doc": "Use this option to avoid parsing errors for corrupted assemblies"
                },
                {
                    "id": "#abra2_2.22.cwl/bam_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--index"
                    },
                    "doc": "Enable BAM index generation when outputting sorted alignments (may require additonal memory)"
                },
                {
                    "id": "#abra2_2.22.cwl/input_vcf",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--in-vcf"
                    },
                    "doc": "VCF containing known (or suspected) variant sites.  Very large files should be avoided."
                },
                {
                    "id": "#abra2_2.22.cwl/no_edge_complex_indel",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--no-edge-ci"
                    },
                    "doc": "Prevent output of complex indels at read start or read end"
                },
                {
                    "id": "#abra2_2.22.cwl/no_sort",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--nosort"
                    },
                    "doc": "Do not attempt to sort final output"
                }
            ],
            "outputs": [
                {
                    "id": "#abra2_2.22.cwl/abra_realigned_bam",
                    "type": [
                        "null",
                        "File",
                        {
                            "type": "array",
                            "items": "File"
                        }
                    ],
                    "outputBinding": {
                        "glob": "*abra.bam"
                    },
                    "secondaryFiles": [
                        "^.bai"
                    ]
                }
            ],
            "label": "abra2_2.22",
            "arguments": [
                {
                    "position": 0,
                    "valueFrom": "${ if(inputs.memory_per_job && inputs.memory_overhead) { if(inputs.memory_per_job % 1000 == 0) { return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\" } else { return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" } } else if (inputs.memory_per_job && !inputs.memory_overhead){ if(inputs.memory_per_job % 1000 == 0) { return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\" } else { return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\" } } else if(!inputs.memory_per_job && inputs.memory_overhead){ return \"-Xmx15G\" } else { return \"-Xmx15G\" } }"
                },
                {
                    "position": 0,
                    "prefix": "-jar",
                    "valueFrom": "/usr/local/bin/abra2.jar"
                }
            ],
            "requirements": [
                {
                    "class": "ResourceRequirement",
                    "ramMin": "${ if(inputs.memory_per_job && inputs.memory_overhead) { return inputs.memory_per_job + inputs.memory_overhead } else if (inputs.memory_per_job && !inputs.memory_overhead){ return inputs.memory_per_job + 2000 } else if(!inputs.memory_per_job && inputs.memory_overhead){ return 15000 + inputs.memory_overhead } else { return 17000 } }",
                    "coresMin": "${ if (inputs.number_of_threads) { return inputs.number_of_threads } else { return 4 } }"
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "mskaccess/abra2:2.22"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:kumarn1@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Nikhil Kumar"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:shahr2@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Ronak Shah"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "abra2",
                    "http://usefulinc.com/ns/doap#revision": 2.22
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#bedtools_genomecov_v2.28.0_cv2.cwl",
            "baseCommand": [
                "bedtools",
                "genomecov"
            ],
            "inputs": [
                {
                    "id": "#bedtools_genomecov_v2.28.0_cv2.cwl/input",
                    "type": "File",
                    "inputBinding": {
                        "position": 5,
                        "prefix": "-ibam",
                        "shellQuote": false
                    },
                    "doc": "The input file can be in BAM format (Note: BAM  must be sorted by position)",
                    "secondaryFiles": [
                        "^.bai"
                    ]
                },
                {
                    "id": "#bedtools_genomecov_v2.28.0_cv2.cwl/output_file_name",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#bedtools_genomecov_v2.28.0_cv2.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#bedtools_genomecov_v2.28.0_cv2.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#bedtools_genomecov_v2.28.0_cv2.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#bedtools_genomecov_v2.28.0_cv2.cwl/option_bedgraph",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-bg",
                        "separate": false
                    },
                    "doc": "option flag parameter to choose output file format. -bg refers to bedgraph format"
                }
            ],
            "outputs": [
                {
                    "id": "#bedtools_genomecov_v2.28.0_cv2.cwl/bedtools_genomecove_bedgraph",
                    "type": "File",
                    "outputBinding": {
                        "glob": "${\n     if (inputs.output_file_name)\n      return inputs.output_file_name;\n    return inputs.input.basename.replace('.bam','.bedgraph');\n  }"
                    }
                }
            ],
            "label": "bedtools_genomecov",
            "requirements": [
                {
                    "class": "ShellCommandRequirement"
                },
                {
                    "class": "ResourceRequirement",
                    "ramMin": 20000,
                    "coresMin": 1
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "biocontainers/bedtools:v2.28.0_cv2"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "stdout": "${\n    if (inputs.output_file_name)\n      return inputs.output_file_name;\n    return inputs.input.basename.replace('.bam','.bedgraph');\n  }",
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:sumans@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Shalabh Suman"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:sumans@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Shalabh Suman"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "bedtools",
                    "http://usefulinc.com/ns/doap#revision": "v2.28.0_cv2"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#bedtools_merge_v2.28.0_cv2.cwl",
            "baseCommand": [
                "bedtools",
                "merge"
            ],
            "inputs": [
                {
                    "id": "#bedtools_merge_v2.28.0_cv2.cwl/input",
                    "type": "File",
                    "inputBinding": {
                        "position": 5,
                        "prefix": "-i",
                        "shellQuote": false
                    },
                    "doc": "BEDgraph format file generated from Bedtools Genomecov module"
                },
                {
                    "id": "#bedtools_merge_v2.28.0_cv2.cwl/output_file_name",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#bedtools_merge_v2.28.0_cv2.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#bedtools_merge_v2.28.0_cv2.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#bedtools_merge_v2.28.0_cv2.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "default": 0,
                    "id": "#bedtools_merge_v2.28.0_cv2.cwl/distance_between_features",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-d",
                        "shellQuote": false
                    },
                    "doc": "Maximum distance between features allowed for features to be merged."
                }
            ],
            "outputs": [
                {
                    "id": "#bedtools_merge_v2.28.0_cv2.cwl/bedtools_merge_bed",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "${\n    if (inputs.output_file_name)\n      return inputs.output_file_name;\n    return inputs.input.basename.replace('.bedgraph', '.bed');\n  }"
                    }
                }
            ],
            "label": "bedtools_merge",
            "requirements": [
                {
                    "class": "ShellCommandRequirement"
                },
                {
                    "class": "ResourceRequirement",
                    "ramMin": 20000,
                    "coresMin": 1
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "biocontainers/bedtools:v2.28.0_cv2"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "stdout": "${\n    if (inputs.output_file_name)\n      return inputs.output_file_name;\n    return inputs.input.basename.replace('.bedgraph', '.bed');\n  }",
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:sumans@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Shalabh Suman"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:sumans@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Shalabh Suman"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "bedtools",
                    "http://usefulinc.com/ns/doap#revision": "v2.28.0_cv2"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "bwa",
                "mem"
            ],
            "inputs": [
                {
                    "id": "#bwa_mem_0.7.17.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory per job in megabytes"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory overhead per job in megabytes"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/reads",
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "inputBinding": {
                        "position": 3
                    }
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/reference",
                    "type": "File",
                    "inputBinding": {
                        "position": 2
                    },
                    "secondaryFiles": [
                        ".amb",
                        ".ann",
                        ".bwt",
                        ".pac",
                        ".sa",
                        ".fai"
                    ]
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/A",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-A"
                    },
                    "doc": "score for a sequence match, which scales options -TdBOELU unless overridden [1]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/B",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-B"
                    },
                    "doc": "penalty for a mismatch [4]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/C",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-C"
                    },
                    "doc": "append FASTA/FASTQ comment to SAM output"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/E",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "int"
                        }
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-E",
                        "itemSeparator": ","
                    },
                    "doc": "gap extension penalty; a gap of size k cost '{-O} + {-E}*k' [1,1]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/L",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "int"
                        }
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-L",
                        "itemSeparator": ","
                    },
                    "doc": "penalty for 5'- and 3'-end clipping [5,5]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/M",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-M"
                    }
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/O",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "int"
                        }
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-O",
                        "itemSeparator": ","
                    },
                    "doc": "gap open penalties for deletions and insertions [6,6]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/P",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-P"
                    },
                    "doc": "skip pairing; mate rescue performed unless -S also in use"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/S",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-S"
                    },
                    "doc": "skip mate rescue"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/T",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-T"
                    },
                    "doc": "minimum score to output [30]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/U",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-U"
                    },
                    "doc": "penalty for an unpaired read pair [17]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/a",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-a"
                    },
                    "doc": "output all alignments for SE or unpaired PE"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/c",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-c"
                    },
                    "doc": "skip seeds with more than INT occurrences [500]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/d",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-d"
                    },
                    "doc": "off-diagonal X-dropoff [100]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/k",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-k"
                    },
                    "doc": "minimum seed length [19]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/K",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-K"
                    },
                    "doc": "process INT input bases in each batch regardless of nThreads (for reproducibility) []"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/output",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/p",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-p"
                    },
                    "doc": "smart pairing (ignoring in2.fq)"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/r",
                    "type": [
                        "null",
                        "float"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-r"
                    },
                    "doc": "look for internal seeds inside a seed longer than {-k} * FLOAT [1.5]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/v",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-v"
                    },
                    "doc": "verbosity level: 1=error, 2=warning, 3=message, 4+=debugging [3]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/w",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-w"
                    },
                    "doc": "band width for banded alignment [100]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/y",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-y"
                    },
                    "doc": "seed occurrence for the 3rd round seeding [20]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/D",
                    "type": [
                        "null",
                        "float"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-D"
                    },
                    "doc": "drop chains shorter than FLOAT fraction of the longest overlapping chain [0.50]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/W",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-W"
                    },
                    "doc": "discard a chain if seeded bases shorter than INT [0]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/m",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-m"
                    },
                    "doc": "perform at most INT rounds of mate rescues for each read [50]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/e",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-e"
                    }
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/x",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-x"
                    },
                    "doc": "read type. Setting -x changes multiple parameters unless overridden [null] pacbio: -k17 -W40 -r10 -A1 -B1 -O1 -E1 -L0  (PacBio reads to ref) ont2d: -k14 -W20 -r10 -A1 -B1 -O1 -E1 -L0  (Oxford Nanopore 2D-reads to ref) intractg: -B9 -O16 -L5  (intra-species contigs to ref)"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/H",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-H"
                    },
                    "doc": "Use hard clipping \u2019H\u2019 in the SAM output. This option may dramatically reduce the redundancy of output when mapping long contig or BAC sequences"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/j",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-j"
                    },
                    "doc": "treat ALT contigs as part of the primary assembly (i.e. ignore <idxbase>.alt file)"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/he",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "int"
                        }
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-h",
                        "itemSeparator": ","
                    },
                    "doc": "if there are <INT hits with score >80% of the max score, output all in XA [5,200]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/V",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-V"
                    },
                    "doc": "output the reference FASTA header in the XR tag"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/Y",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-Y"
                    },
                    "doc": "use soft clipping for supplementary alignments"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/I",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-M"
                    }
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/R",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "STR read group header line such as '@RG\\tID -foo\\tSM -bar' [null]"
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/sample_id",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/lane_id",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/platform",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/platform_unit",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/center_name",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                {
                    "id": "#bwa_mem_0.7.17.cwl/library_id",
                    "type": [
                        "null",
                        "string"
                    ]
                }
            ],
            "outputs": [
                {
                    "id": "#bwa_mem_0.7.17.cwl/bwa_mem_output_sam",
                    "type": "File",
                    "outputBinding": {
                        "glob": "${\n  if (inputs.output)\n    return inputs.output;\n  return inputs.reads[0].basename.replace(/(fastq.gz)|(fq.gz)/, 'sam');\n}"
                    }
                }
            ],
            "doc": "bwa mem [-aCHMpP] [-t nThreads] [-k minSeedLen] [-w bandWidth] [-d zDropoff] [-r seedSplitRatio] [-c maxOcc] [-A matchScore] [-B mmPenalty] [-O gapOpenPen] [-E gapExtPen] [-L clipPen] [-U unpairPen] [-R RGline] [-v verboseLevel] db.prefix reads.fq [mates.fq]\nAlign 70bp-1Mbp query sequences with the BWA-MEM algorithm. Briefly, the algorithm works by seeding alignments with maximal exact matches (MEMs) and then extending seeds with the affine-gap Smith-Waterman algorithm (SW).\n\nIf mates.fq file is absent and option -p is not set, this command regards input reads are single-end. If mates.fq is present, this command assumes the i-th read in reads.fq and the i-th read in mates.fq constitute a read pair. If -p is used, the command assumes the 2i-th and the (2i+1)-th read in reads.fq constitute a read pair (such input file is said to be interleaved). In this case, mates.fq is ignored. In the paired-end mode, the mem command will infer the read orientation and the insert size distribution from a batch of reads.\n\nThe BWA-MEM algorithm performs local alignment. It may produce multiple primary alignments for different part of a query sequence. This is a crucial feature for long sequences. However, some tools such as Picard\u2019s markDuplicates does not work with split alignments. One may consider to use option -M to flag shorter split hits as secondary.",
            "label": "bwa_mem_0.7.17",
            "arguments": [
                {
                    "position": 0,
                    "prefix": "-t",
                    "valueFrom": "$(runtime.cores)"
                },
                {
                    "position": 0,
                    "prefix": "-R",
                    "valueFrom": "${\n    if (inputs.sample_id) {\n        var rg_id = \"@RG\\\\tID:\" + inputs.sample_id + \"\\\\tSM:\" + inputs.sample_id;\n        if (inputs.library_id) {\n            rg_id += \"\\\\tLB:\" + inputs.library_id;\n        } if (inputs.platform) {\n            rg_id += \"\\\\tPL:\" + inputs.platform;\n        } if (inputs.platform_unit) {\n            rg_id += \"\\\\tPU:\" + inputs.platform_unit;\n        } if (inputs.center_name) {\n            rg_id += \"\\\\tCN:\" + inputs.center_name;\n        }\n        return rg_id\n    } else {\n        return inputs.R\n    }\n}"
                }
            ],
            "requirements": [
                {
                    "class": "ResourceRequirement",
                    "ramMin": "${ if(inputs.memory_per_job && inputs.memory_overhead) { return inputs.memory_per_job + inputs.memory_overhead } else if (inputs.memory_per_job && !inputs.memory_overhead){ return inputs.memory_per_job + 2000 } else if(!inputs.memory_per_job && inputs.memory_overhead){ return 32000 + inputs.memory_overhead } else { return 32000 } }",
                    "coresMin": "${ if (inputs.number_of_threads) { return inputs.number_of_threads } else { return 16 } }"
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "mskaccess/bwa_mem_0.7.17:0.1.0"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "stdout": "${\n  if (inputs.output)\n    return inputs.output;\n  return inputs.reads[0].basename.replace(/(fastq.gz)|(fq.gz)/, 'sam');\n}",
            "id": "#bwa_mem_0.7.17.cwl",
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:shahr2@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Ronak Shah"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:johnsoni@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Ian Johnson"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "bwa",
                    "http://usefulinc.com/ns/doap#revision": "0.7.17"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#gatk_apply_bqsr_4.1.8.1.cwl",
            "baseCommand": [
                "gatk"
            ],
            "inputs": [
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/reference",
                    "type": "File",
                    "inputBinding": {
                        "position": 4,
                        "prefix": "--reference"
                    },
                    "doc": "Reference sequence",
                    "secondaryFiles": [
                        ".fai",
                        "^.dict"
                    ]
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/create_output_bam_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--create-output-bam-index"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/bqsr_recal_file",
                    "type": "File",
                    "inputBinding": {
                        "position": 4,
                        "prefix": "--bqsr-recal-file"
                    },
                    "doc": "Input recalibration table for BQSR. Only run ApplyBQSR with the covariates table created from the input BAM"
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/input",
                    "type": "File",
                    "inputBinding": {
                        "position": 4,
                        "prefix": "--input"
                    },
                    "doc": "A BAM file containing input read data",
                    "secondaryFiles": [
                        "^.bai"
                    ]
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "Output file name. Not Required"
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/add_output_sam_program_record",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--add-output-sam-program-record"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/add_output_vcf_command_line",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--add-output-vcf-command-line"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/arguments_file",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--arguments_file"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/cloud_index_prefetch_buffer",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--cloud-index-prefetch-buffer"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/cloud_prefetch_buffer",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--cloud-prefetch-buffer"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/create_output_bam_md5",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--create-output-bam-md5"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/create_output_variant_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--create-output-variant-index"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/create_output_variant_md5",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--create-output-variant-md5"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/disable_bam_index_caching",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--disable-bam-index-caching"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/disable_read_filter",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "string",
                            "inputBinding": {
                                "prefix": "--disable-read-filter"
                            }
                        }
                    ],
                    "inputBinding": {
                        "position": 6
                    },
                    "doc": "Read filters to be disabled before analysis"
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/disable_sequence_dictionary_validation",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--disable-sequence-dictionary-validation"
                    }
                },
                {
                    "default": true,
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/emit_original_quals",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--emit-original-quals"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/exclude_intervals",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--exclude-intervals"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/gatk_config_file",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--gatk-config-file"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/gcs_max_retries",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--gcs-max-retries"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/gcs_project_for_requester_pays",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--gcs-project-for-requester-pays"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/global_qscore_prior",
                    "type": [
                        "null",
                        "float"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--global-qscore-prior"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/interval_exclusion_padding",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--interval-exclusion-padding"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/interval_merging_rule",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--interval-merging-rule"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/interval_padding",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--interval-padding"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/interval_set_rule",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--interval-set-rule"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/intervals",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--intervals"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/lenient",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--lenient"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/preserve_qscores_less_than",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--preserve-qscores-less-than"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/quantize_quals",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--quantize-quals"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/quiet",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--QUIET"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/read_filter",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "string",
                            "inputBinding": {
                                "prefix": "--read-filter"
                            }
                        }
                    ],
                    "inputBinding": {
                        "position": 6
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/read_index",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--read-index"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/read_validation_stringency",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--read-validation-stringency"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/seconds_between_progress_updates",
                    "type": [
                        "null",
                        "float"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--seconds-between-progress-updates"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/sequence_dictionary",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--sequence-dictionary"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/sites_only_vcf_output",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--sites-only-vcf-output"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/use_jdk_deflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--use-jdk-deflater"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/use_jdk_inflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--use-jdk-inflater"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/use_original_qualities",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 6,
                        "prefix": "--use-original-qualities"
                    }
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                }
            ],
            "outputs": [
                {
                    "id": "#gatk_apply_bqsr_4.1.8.1.cwl/gatk_apply_bqsr_bam",
                    "type": [
                        "null",
                        "File"
                    ],
                    "outputBinding": {
                        "glob": "${\n    if(inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return inputs.input.basename.replace(/.bam/, '_bqsr.bam')\n    }\n}"
                    },
                    "secondaryFiles": [
                        "^.bai"
                    ]
                }
            ],
            "label": "gatk_apply_bqsr_4.1.8.1",
            "arguments": [
                {
                    "position": 0,
                    "prefix": "--java-options",
                    "valueFrom": "${\n     if(inputs.memory_per_job && inputs.memory_overhead){\n        if(inputs.memory_per_job % 1000 == 0){\n            return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n        } else {\n            return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n        }\n     } else if (inputs.memory_per_job && !inputs.memory_overhead){\n        if(inputs.memory_per_job % 1000 == 0) {\n            return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n        } else {\n            return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n        }\n     } else if(!inputs.memory_per_job && inputs.memory_overhead){\n        return \"-Xmx4G\"\n     } else {\n        return \"-Xmx4G\"\n     }\n}"
                },
                {
                    "position": 2,
                    "prefix": "--output",
                    "valueFrom": "${\n    if(inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return inputs.input.basename.replace(/.bam/, '_bqsr.bam')\n    }\n}"
                },
                {
                    "position": 2,
                    "prefix": "--tmp-dir",
                    "valueFrom": "$(runtime.tmpdir)"
                },
                {
                    "position": 1,
                    "prefix": "",
                    "separate": false,
                    "valueFrom": "ApplyBQSR"
                }
            ],
            "requirements": [
                {
                    "class": "ResourceRequirement",
                    "ramMin": 10000,
                    "coresMin": 8
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "broadinstitute/gatk:4.1.8.1"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:shahr2@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Ronak Shah"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                },
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:sumans@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Shalabh Suman"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:shahr2@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Ronak Shah"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "gatk4",
                    "http://usefulinc.com/ns/doap#revision": "4.1.8.1"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#gatk_base_recalibrator_4.1.8.1.cwl",
            "baseCommand": [
                "gatk"
            ],
            "inputs": [
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/input",
                    "type": "File",
                    "inputBinding": {
                        "position": 3,
                        "prefix": "--input"
                    },
                    "doc": "BAM/SAM file containing reads",
                    "secondaryFiles": [
                        "^.bai"
                    ]
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/known_sites",
                    "type": {
                        "type": "array",
                        "items": "File",
                        "inputBinding": {
                            "prefix": "--known-sites"
                        }
                    },
                    "inputBinding": {
                        "position": 3
                    },
                    "doc": "One or more databases of known polymorphic sites used to exclude regions around known polymorphisms from analysis",
                    "secondaryFiles": [
                        ".idx"
                    ]
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/reference",
                    "type": "File",
                    "inputBinding": {
                        "position": 3,
                        "prefix": "--reference"
                    },
                    "doc": "Reference sequence file",
                    "secondaryFiles": [
                        ".fai",
                        "^.dict"
                    ]
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "Output file name. Not Required"
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/add_output_sam_program_record",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--add-output-sam-program-record"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/add_output_vcf_command_line",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--add-output-vcf-command-line"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/arguments_file",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "File",
                            "inputBinding": {
                                "position": 0,
                                "prefix": "--arguments_file"
                            }
                        }
                    ]
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/binary_tag_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--binary-tag-name"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/bqsr_baq_gap_open_penalty",
                    "type": [
                        "null",
                        "float"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--bqsr-baq-gap-open-penalty"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/cloud-index-prefetch-buffer",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--cloud-index-prefetch-buffer"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/cloud_prefetch_buffer",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--cloud-prefetch-buffer"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/create_output_bam_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--create-output-bam-index"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/create_output_bam_md5",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--create-output-bam-md5"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/create_output_variant_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--create-output-variant-index"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/create_output_variant_md5",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--create-output-variant-md5"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/default_base_qualities",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--default-base-qualities"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/deletions_default_quality",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--deletions-default-quality"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/disable_bam_index_caching",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--disable-bam-index-caching"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/disable_read_filter",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "string",
                            "inputBinding": {
                                "prefix": "--disable-read-filter"
                            }
                        }
                    ],
                    "inputBinding": {
                        "position": 10
                    },
                    "doc": "Read filters to be disabled before analysis"
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/disable_sequence_dictionary_validation",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--disable-sequence-dictionary-validation"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/exclude_intervals",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--exclude-intervals"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/gatk_config_file",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--gatk-config-file"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/gcs_max_retries",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--gcs-max-retries"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/gcs_project_for_requester_pays",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--gcs-project-for-requester-pays"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/indels_context_size",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--indels-context-size"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/insertions_default_quality",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--insertions-default-quality"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/interval_exclusion_padding",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--interval-exclusion-padding"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/interval_merging_rule",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--interval-merging-rule"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/interval_padding",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--interval-padding"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/interval_set_rule",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--interval-set-rule"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/intervals",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--intervals"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/lenient",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--lenient"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/low_quality_tail",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--low-quality-tail"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/maximum_cycle_value",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--maximum-cycle-value"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/mismatches_context_size",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--mismatches-context-size"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/mismatches_default_quality",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--mismatches-default-quality"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/preserve_qscores_less_than",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--preserve-qscores-less-than"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/quantizing_levels",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--quantizing-levels"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/QUIET",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--QUIET"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/read_filter",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "string",
                            "inputBinding": {
                                "prefix": "--read-filter"
                            }
                        }
                    ],
                    "inputBinding": {
                        "position": 10
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/read_index",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--read-index"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/seconds_between_progress_updates",
                    "type": [
                        "null",
                        "float"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--seconds-between-progress-updates"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/sequence_dictionary",
                    "type": [
                        "null",
                        "File"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--sequence-dictionary"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/sites_only_vcf_output",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--sites-only-vcf-output"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/use_original_qualities",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 10,
                        "prefix": "--use-original-qualities"
                    }
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ]
                }
            ],
            "outputs": [
                {
                    "id": "#gatk_base_recalibrator_4.1.8.1.cwl/gatk_base_recalibrator_output",
                    "type": "File",
                    "outputBinding": {
                        "glob": "${\n    if(inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return inputs.input.basename.replace(/.bam/, '_bqsr.table')\n    }\n}"
                    }
                }
            ],
            "label": "gatk_base_recalibrator_4.1.8.1",
            "arguments": [
                {
                    "position": 0,
                    "prefix": "--java-options",
                    "valueFrom": "${\n     if(inputs.memory_per_job && inputs.memory_overhead){\n        if(inputs.memory_per_job % 1000 == 0){\n            return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n        } else {\n            return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n        }\n     } else if (inputs.memory_per_job && !inputs.memory_overhead){\n        if(inputs.memory_per_job % 1000 == 0) {\n            return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n        } else {\n            return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n        }\n     } else if(!inputs.memory_per_job && inputs.memory_overhead){\n        return \"-Xmx4G\"\n     } else {\n        return \"-Xmx4G\"\n     }\n}"
                },
                {
                    "position": 1,
                    "prefix": "",
                    "separate": false,
                    "valueFrom": "BaseRecalibrator"
                },
                {
                    "position": 2,
                    "prefix": "--tmp-dir",
                    "valueFrom": "$(runtime.tmpdir)"
                },
                {
                    "position": 2,
                    "prefix": "--output",
                    "valueFrom": "${\n    if(inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return inputs.input.basename.replace(/.bam/, '_bqsr.table')\n    }\n}"
                },
                {
                    "position": 2,
                    "prefix": "--verbosity",
                    "valueFrom": "INFO"
                }
            ],
            "requirements": [
                {
                    "class": "ResourceRequirement",
                    "ramMin": 32000,
                    "coresMin": 8
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "broadinstitute/gatk:4.1.8.1"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:shahr2@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Ronak Shah"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                },
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:sumans@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Shalabh Suman"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:shahr2@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Ronak Shah"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl",
            "baseCommand": [
                "java"
            ],
            "inputs": [
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory per job in megabytes"
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory overhead per job in megabytes"
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/input",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-I"
                    },
                    "doc": "Input file ( sam).  Required."
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "Output file name (bam or sam). Not Required"
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/sort_order",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-SO"
                    },
                    "doc": "Optional sort order to output in. If not supplied OUTPUT is in the same order as INPUT.Default value: null. Possible values: {unsorted, queryname, coordinate}"
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/read_group_identifier",
                    "type": "string",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--RGID"
                    },
                    "doc": "Read Group ID  Default value: 1. This option can be set to 'null' to clear the default value  Required"
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/read_group_sequencing_center",
                    "type": "string",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--RGCN"
                    },
                    "doc": "Read Group sequencing center name  Default value: null. Required"
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/read_group_library",
                    "type": "string",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--RGLB"
                    },
                    "doc": "Read Group Library.  Required"
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/read_group_platform_unit",
                    "type": "string",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--RGPU"
                    },
                    "doc": "Read Group platform unit (eg. run barcode)  Required."
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/read_group_sample_name",
                    "type": "string",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--RGSM"
                    },
                    "doc": "Read Group sample name.  Required"
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/read_group_sequencing_platform",
                    "type": "string",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--RGPL"
                    },
                    "doc": "Read Group platform (e.g. illumina, solid)  Required."
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/read_group_description",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--RGDS"
                    },
                    "doc": "Read Group description  Default value: null."
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/read_group_run_date",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--RGDT"
                    },
                    "doc": "Read Group run date  Default value: null."
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/validation_stringency",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--VALIDATION_STRINGENCY"
                    },
                    "doc": "Validation stringency for all SAM files read by this program.  Setting stringency to SILENT can improve performance when processing a BAM file in which variable-length data (read, qualities, tags) do not otherwise need to be decoded.  Default value: STRICT. This option can be set to 'null' to clear the default value. Possible values: {STRICT,LENIENT, SILENT}"
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/bam_compression_level",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--COMPRESSION_LEVEL"
                    },
                    "doc": "Compression level for all compressed files created (e.g. BAM and GELI). Default value:5. This option can be set to 'null' to clear the default value."
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/use_jdk_deflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--USE_JDK_DEFLATER"
                    },
                    "doc": "Use the JDK Deflater instead of the Intel Deflater for writing compressed output"
                },
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/use_jdk_inflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--USE_JDK_INFLATER"
                    },
                    "doc": "Use the JDK Inflater instead of the Intel Inflater for reading compressed input"
                },
                {
                    "default": true,
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/create_bam_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CREATE_INDEX"
                    },
                    "doc": "Whether to create a BAM index when writing a coordinate-sorted BAM file. Default value:false. This option can be set to 'null' to clear the default value. Possible values:{true, false}"
                }
            ],
            "outputs": [
                {
                    "id": "#picard_add_or_replace_read_groups_4.1.8.1.cwl/picard_add_or_replace_read_groups_bam",
                    "type": "File",
                    "outputBinding": {
                        "glob": "${\n    if(inputs.output_file_name)\n        return inputs.output_file_name;\n    return inputs.input.basename.replace(/.sam$/, '_srt.bam');\n}"
                    },
                    "secondaryFiles": [
                        "^.bai"
                    ]
                }
            ],
            "label": "picard_add_or_replace_read_groups_4.1.8.1",
            "arguments": [
                {
                    "position": 0,
                    "valueFrom": "${\n  if(inputs.memory_per_job && inputs.memory_overhead) {\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if (inputs.memory_per_job && !inputs.memory_overhead){\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if(!inputs.memory_per_job && inputs.memory_overhead){\n    return \"-Xmx15G\"\n  }\n  else {\n      return \"-Xmx15G\"\n  }\n}"
                },
                {
                    "position": 0,
                    "valueFrom": "-XX:-UseGCOverheadLimit",
                    "shellQuote": false
                },
                {
                    "position": 0,
                    "valueFrom": "-Djava.io.tmpdir=$(runtime.tmpdir)",
                    "shellQuote": false
                },
                {
                    "position": 0,
                    "prefix": "-jar",
                    "valueFrom": "/gatk/gatk-package-4.1.8.1-local.jar"
                },
                {
                    "position": 0,
                    "valueFrom": "AddOrReplaceReadGroups"
                },
                {
                    "position": 0,
                    "prefix": "--TMP_DIR",
                    "valueFrom": "$(runtime.tmpdir)"
                },
                {
                    "position": 0,
                    "prefix": "-O",
                    "valueFrom": "${\n    if(inputs.output_file_name)\n        return inputs.output_file_name;\n      return inputs.input.basename.replace(/.sam$/, '_srt.bam');\n}"
                }
            ],
            "requirements": [
                {
                    "class": "ResourceRequirement",
                    "ramMin": 25000,
                    "coresMin": 2
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "broadinstitute/gatk:4.1.8.1"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:kumarn1@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Nikhil Kumar"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:shahr2@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Ronak Shah"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "picard",
                    "http://usefulinc.com/ns/doap#revision": "4.1.8.1"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "id": "#picard_fix_mate_information_4.1.8.1.cwl",
            "baseCommand": [
                "java"
            ],
            "inputs": [
                {
                    "id": "#picard_fix_mate_information_4.1.8.1.cwl/memory_per_job",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory per job in megabytes"
                },
                {
                    "id": "#picard_fix_mate_information_4.1.8.1.cwl/memory_overhead",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "Memory overhead per job in megabytes"
                },
                {
                    "id": "#picard_fix_mate_information_4.1.8.1.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ]
                },
                {
                    "id": "#picard_fix_mate_information_4.1.8.1.cwl/input",
                    "type": "File",
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-I"
                    },
                    "doc": "The input file to fix.  This option may be specified 0 or more times",
                    "secondaryFiles": [
                        "^.bai"
                    ]
                },
                {
                    "id": "#picard_fix_mate_information_4.1.8.1.cwl/output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "Output file name (bam or sam). Not Required"
                },
                {
                    "id": "#picard_fix_mate_information_4.1.8.1.cwl/sort_order",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "-SO"
                    },
                    "doc": "Optional sort order to output in. If not supplied OUTPUT is in the same order as INPUT.Default value: null. Possible values: {unsorted, queryname, coordinate}"
                },
                {
                    "id": "#picard_fix_mate_information_4.1.8.1.cwl/validation_stringency",
                    "type": [
                        "null",
                        "string"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--VALIDATION_STRINGENCY"
                    },
                    "doc": "Validation stringency for all SAM files read by this program.  Setting stringency to SILENT can improve performance when processing a BAM file in which variable-length data (read, qualities, tags) do not otherwise need to be decoded.  Default value: STRICT. This option can be set to 'null' to clear the default value. Possible values: {STRICT,LENIENT, SILENT}"
                },
                {
                    "id": "#picard_fix_mate_information_4.1.8.1.cwl/bam_compression_level",
                    "type": [
                        "null",
                        "int"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--COMPRESSION_LEVEL"
                    },
                    "doc": "Compression level for all compressed files created (e.g. BAM and GELI). Default value:5. This option can be set to 'null' to clear the default value."
                },
                {
                    "id": "#picard_fix_mate_information_4.1.8.1.cwl/use_jdk_deflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--USE_JDK_DEFLATER"
                    },
                    "doc": "Use the JDK Deflater instead of the Intel Deflater for writing compressed output"
                },
                {
                    "id": "#picard_fix_mate_information_4.1.8.1.cwl/use_jdk_inflater",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--USE_JDK_INFLATER"
                    },
                    "doc": "Use the JDK Inflater instead of the Intel Inflater for reading compressed input"
                },
                {
                    "default": true,
                    "id": "#picard_fix_mate_information_4.1.8.1.cwl/create_bam_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "inputBinding": {
                        "position": 0,
                        "prefix": "--CREATE_INDEX"
                    },
                    "doc": "Whether to create a BAM index when writing a coordinate-sorted BAM file. Default value:false. This option can be set to 'null' to clear the default value. Possible values:{true, false}"
                }
            ],
            "outputs": [
                {
                    "id": "#picard_fix_mate_information_4.1.8.1.cwl/picard_fix_mate_information_bam",
                    "type": "File",
                    "outputBinding": {
                        "glob": "${\n    if(inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return inputs.input.basename.replace(/.bam/,'_fm.bam')\n    }\n}"
                    },
                    "secondaryFiles": [
                        "^.bai"
                    ]
                }
            ],
            "label": "picard_fix_mate_information_4.1.8.1",
            "arguments": [
                {
                    "position": 0,
                    "valueFrom": "${\n  if(inputs.memory_per_job && inputs.memory_overhead) {\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if (inputs.memory_per_job && !inputs.memory_overhead){\n    if(inputs.memory_per_job % 1000 == 0) {\n      return \"-Xmx\" + (inputs.memory_per_job/1000).toString() + \"G\"\n    }\n    else {\n      return \"-Xmx\" + Math.floor((inputs.memory_per_job/1000)).toString() + \"G\"\n    }\n  }\n  else if(!inputs.memory_per_job && inputs.memory_overhead){\n    return \"-Xmx15G\"\n  }\n  else {\n      return \"-Xmx15G\"\n  }\n}"
                },
                {
                    "position": 0,
                    "valueFrom": "-XX:-UseGCOverheadLimit",
                    "shellQuote": false
                },
                {
                    "position": 0,
                    "valueFrom": "-Djava.io.tmpdir=$(runtime.tmpdir)",
                    "shellQuote": false
                },
                {
                    "position": 0,
                    "prefix": "-jar",
                    "valueFrom": "/gatk/gatk-package-4.1.8.1-local.jar"
                },
                {
                    "position": 0,
                    "valueFrom": "FixMateInformation"
                },
                {
                    "position": 0,
                    "prefix": "--TMP_DIR",
                    "valueFrom": "$(runtime.tmpdir)"
                },
                {
                    "position": 0,
                    "prefix": "-O",
                    "valueFrom": "${\n    if(inputs.output_file_name){\n        return inputs.output_file_name\n    } else {\n        return inputs.input.basename.replace(/.bam/,'_fm.bam')\n    }\n}"
                }
            ],
            "requirements": [
                {
                    "class": "ResourceRequirement",
                    "ramMin": 25000,
                    "coresMin": 2
                },
                {
                    "class": "DockerRequirement",
                    "dockerPull": "broadinstitute/gatk:4.1.8.1"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "http://purl.org/dc/terms/contributor": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:kumarn1@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Nikhil Kumar"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://purl.org/dc/terms/creator": [
                {
                    "class": "http://xmlns.com/foaf/0.1/Organization",
                    "http://xmlns.com/foaf/0.1/member": [
                        {
                            "class": "http://xmlns.com/foaf/0.1/Person",
                            "http://xmlns.com/foaf/0.1/mbox": "mailto:shahr2@mskcc.org",
                            "http://xmlns.com/foaf/0.1/name": "Ronak Shah"
                        }
                    ],
                    "http://xmlns.com/foaf/0.1/name": "Memorial Sloan Kettering Cancer Center"
                }
            ],
            "http://usefulinc.com/ns/doap#release": [
                {
                    "class": "http://usefulinc.com/ns/doap#Version",
                    "http://usefulinc.com/ns/doap#name": "picard",
                    "http://usefulinc.com/ns/doap#revision": "4.1.8.1"
                }
            ]
        },
        {
            "class": "Workflow",
            "id": "#indel_realignment.cwl",
            "label": "indel_realignment",
            "inputs": [
                {
                    "id": "#indel_realignment.cwl/window_size",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 0
                },
                {
                    "id": "#indel_realignment.cwl/soft_clip_contig",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 319.96875
                },
                {
                    "id": "#indel_realignment.cwl/scoring_gap_alignments",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 426.703125
                },
                {
                    "id": "#indel_realignment.cwl/reference_fasta",
                    "type": "File",
                    "secondaryFiles": [
                        "^.fasta.fai"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 533.359375
                },
                {
                    "id": "#indel_realignment.cwl/no_sort",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 959.828125
                },
                {
                    "id": "#indel_realignment.cwl/maximum_mixmatch_rate",
                    "type": [
                        "null",
                        "float"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1173.140625
                },
                {
                    "id": "#indel_realignment.cwl/maximum_average_depth",
                    "type": [
                        "null",
                        "int"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1279.796875
                },
                {
                    "id": "#indel_realignment.cwl/input_bam",
                    "type": [
                        "File",
                        {
                            "type": "array",
                            "items": "File"
                        }
                    ],
                    "secondaryFiles": [
                        "^.bai"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1386.453125
                },
                {
                    "id": "#indel_realignment.cwl/ignore_bad_assembly",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1493.109375
                },
                {
                    "id": "#indel_realignment.cwl/contig_anchor",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1706.421875
                },
                {
                    "id": "#indel_realignment.cwl/consensus_sequence",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1813.078125
                },
                {
                    "id": "#indel_realignment.cwl/bam_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1919.65625
                },
                {
                    "id": "#indel_realignment.cwl/number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 853.25
                },
                {
                    "id": "#indel_realignment.cwl/option_bedgraph",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 746.59375
                },
                {
                    "id": "#indel_realignment.cwl/no_edge_complex_indel",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1066.484375
                },
                {
                    "id": "#indel_realignment.cwl/distance_between_features",
                    "type": [
                        "null",
                        "int"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1599.765625
                },
                {
                    "id": "#indel_realignment.cwl/output_bams",
                    "type": [
                        "string",
                        {
                            "type": "array",
                            "items": "string"
                        }
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 639.9375
                },
                {
                    "id": "#indel_realignment.cwl/validation_stringency",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 106.65625
                },
                {
                    "id": "#indel_realignment.cwl/sort_order",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 213.3125
                },
                {
                    "id": "#indel_realignment.cwl/output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 992.881103515625,
                    "https://www.sevenbridges.com/y": 748.25
                },
                {
                    "id": "#indel_realignment.cwl/create_bam_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 992.881103515625,
                    "https://www.sevenbridges.com/y": 854.828125
                }
            ],
            "outputs": [
                {
                    "id": "#indel_realignment.cwl/indel_realignment_bam",
                    "outputSource": [
                        "#indel_realignment.cwl/picard_fix_mate_information_4_1_8_1/picard_fix_mate_information_bam"
                    ],
                    "type": "File",
                    "secondaryFiles": [
                        "^.bai?"
                    ],
                    "https://www.sevenbridges.com/x": 1950.827880859375,
                    "https://www.sevenbridges.com/y": 959.75
                }
            ],
            "steps": [
                {
                    "id": "#indel_realignment.cwl/abra2_2_22",
                    "in": [
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/number_of_threads",
                            "source": "#indel_realignment.cwl/number_of_threads"
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/input_bam",
                            "source": [
                                "#indel_realignment.cwl/input_bam"
                            ]
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/reference_fasta",
                            "source": "#indel_realignment.cwl/reference_fasta"
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/targets",
                            "source": "#indel_realignment.cwl/bedtools_merge/bedtools_merge_bed"
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/maximum_average_depth",
                            "source": "#indel_realignment.cwl/maximum_average_depth"
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/soft_clip_contig",
                            "source": "#indel_realignment.cwl/soft_clip_contig"
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/maximum_mixmatch_rate",
                            "source": "#indel_realignment.cwl/maximum_mixmatch_rate"
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/scoring_gap_alignments",
                            "source": "#indel_realignment.cwl/scoring_gap_alignments"
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/contig_anchor",
                            "source": "#indel_realignment.cwl/contig_anchor"
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/window_size",
                            "source": "#indel_realignment.cwl/window_size"
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/consensus_sequence",
                            "source": "#indel_realignment.cwl/consensus_sequence"
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/output_bams",
                            "source": [
                                "#indel_realignment.cwl/output_bams"
                            ]
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/ignore_bad_assembly",
                            "source": "#indel_realignment.cwl/ignore_bad_assembly"
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/bam_index",
                            "source": "#indel_realignment.cwl/bam_index"
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/no_edge_complex_indel",
                            "source": "#indel_realignment.cwl/no_edge_complex_indel"
                        },
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/no_sort",
                            "source": "#indel_realignment.cwl/no_sort"
                        }
                    ],
                    "out": [
                        {
                            "id": "#indel_realignment.cwl/abra2_2_22/abra_realigned_bam"
                        }
                    ],
                    "run": "#abra2_2.22.cwl",
                    "label": "abra2_2.22",
                    "https://www.sevenbridges.com/x": 992.881103515625,
                    "https://www.sevenbridges.com/y": 1066.40625
                },
                {
                    "id": "#indel_realignment.cwl/bedtools_genomecov",
                    "in": [
                        {
                            "id": "#indel_realignment.cwl/bedtools_genomecov/input",
                            "source": "#indel_realignment.cwl/input_bam"
                        },
                        {
                            "id": "#indel_realignment.cwl/bedtools_genomecov/option_bedgraph",
                            "source": "#indel_realignment.cwl/option_bedgraph"
                        }
                    ],
                    "out": [
                        {
                            "id": "#indel_realignment.cwl/bedtools_genomecov/bedtools_genomecove_bedgraph"
                        }
                    ],
                    "run": "#bedtools_genomecov_v2.28.0_cv2.cwl",
                    "label": "bedtools_genomecov",
                    "https://www.sevenbridges.com/x": 269.546875,
                    "https://www.sevenbridges.com/y": 952.75
                },
                {
                    "id": "#indel_realignment.cwl/bedtools_merge",
                    "in": [
                        {
                            "id": "#indel_realignment.cwl/bedtools_merge/input",
                            "source": "#indel_realignment.cwl/bedtools_genomecov/bedtools_genomecove_bedgraph"
                        },
                        {
                            "id": "#indel_realignment.cwl/bedtools_merge/distance_between_features",
                            "source": "#indel_realignment.cwl/distance_between_features"
                        }
                    ],
                    "out": [
                        {
                            "id": "#indel_realignment.cwl/bedtools_merge/bedtools_merge_bed"
                        }
                    ],
                    "run": "#bedtools_merge_v2.28.0_cv2.cwl",
                    "label": "bedtools_merge",
                    "https://www.sevenbridges.com/x": 635.4639892578125,
                    "https://www.sevenbridges.com/y": 952.75
                },
                {
                    "id": "#indel_realignment.cwl/picard_fix_mate_information_4_1_8_1",
                    "in": [
                        {
                            "id": "#indel_realignment.cwl/picard_fix_mate_information_4_1_8_1/input",
                            "source": "#indel_realignment.cwl/abra2_2_22/abra_realigned_bam"
                        },
                        {
                            "id": "#indel_realignment.cwl/picard_fix_mate_information_4_1_8_1/output_file_name",
                            "source": "#indel_realignment.cwl/output_file_name"
                        },
                        {
                            "id": "#indel_realignment.cwl/picard_fix_mate_information_4_1_8_1/sort_order",
                            "source": "#indel_realignment.cwl/sort_order"
                        },
                        {
                            "id": "#indel_realignment.cwl/picard_fix_mate_information_4_1_8_1/validation_stringency",
                            "source": "#indel_realignment.cwl/validation_stringency"
                        },
                        {
                            "id": "#indel_realignment.cwl/picard_fix_mate_information_4_1_8_1/create_bam_index",
                            "source": "#indel_realignment.cwl/create_bam_index"
                        }
                    ],
                    "out": [
                        {
                            "id": "#indel_realignment.cwl/picard_fix_mate_information_4_1_8_1/picard_fix_mate_information_bam"
                        }
                    ],
                    "run": "#picard_fix_mate_information_4.1.8.1.cwl",
                    "label": "picard_fix_mate_information_4.1.8.1",
                    "https://www.sevenbridges.com/x": 1534.827880859375,
                    "https://www.sevenbridges.com/y": 931.6171875
                }
            ],
            "requirements": [],
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:murphyc4@mskcc.org",
                    "https://schema.org/name": "Charlie Murphy"
                }
            ],
            "https://schema.org/citation": "",
            "https://schema.org/codeRepository": "https://github.com/msk-access/cwl_subworkflows/indel_realignment",
            "https://schema.org/contributor": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:murphyc4@mskcc.org",
                    "https://schema.org/name": "Charlie Murphy"
                }
            ],
            "https://schema.org/dateCreated": "2020-09-14",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0"
        },
        {
            "class": "Workflow",
            "id": "#main",
            "doc": "This is the workflow is written using Common Workflow Language (CWL) version 1.0 (https://www.commonwl.org/v1.0/) and is used at Memorial Sloan Kettering Cancer Center for producing standard bam files from the NY state-approved MSK-ACCESS assay. It is meant to be run on a single sample paired-end read 1 and read 2 fastq's, from Illumina sequencing data, but may be generalizable to other sequencing platforms and sequencing panels as well, which produce paired-end data.",
            "label": "Uncollapsed BAM Generation",
            "inputs": [
                {
                    "id": "#fgbio_fastq_to_bam_umi-tag",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 2782
                },
                {
                    "id": "#fgbio_fastq_to_bam_sort",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 2889
                },
                {
                    "id": "#sequencing-center",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 321
                },
                {
                    "id": "#sample",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 428
                },
                {
                    "id": "#run-date",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 535
                },
                {
                    "id": "#read-structures",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "string"
                        }
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 749
                },
                {
                    "id": "#read-group-id",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 856
                },
                {
                    "id": "#fgbio_fastq_to_bam_predicted-insert-size",
                    "type": [
                        "null",
                        "int"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 2996
                },
                {
                    "id": "#platform-unit",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1284
                },
                {
                    "id": "#platform-model",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1391
                },
                {
                    "id": "#platform",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1498
                },
                {
                    "id": "#fgbio_fastq_to_bam_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 3103
                },
                {
                    "id": "#library",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1926
                },
                {
                    "id": "#description",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 4280
                },
                {
                    "id": "#comment",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 4387
                },
                {
                    "id": "#validation_stringency",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 0
                },
                {
                    "id": "#unpaired_fastq_file",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "Name of the Unpaired Fastq File",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 107
                },
                {
                    "id": "#gatk_sam_to_fastq_include_non_primary_alignments",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 2033
                },
                {
                    "id": "#gatk_sam_to_fastq_include_non_pf_reads",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 2140
                },
                {
                    "id": "#R1_output_fastq",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "Name of the R1 output Fastq File",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1177
                },
                {
                    "id": "#R2_output_fastq",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "Name of the R2 Fastq File",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1070
                },
                {
                    "id": "#reference_sequence",
                    "type": "File",
                    "secondaryFiles": [
                        ".amb",
                        ".fai",
                        ".sa",
                        "^.dict",
                        ".ann",
                        ".bwt",
                        ".pac"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 642
                },
                {
                    "id": "#fastp_unpaired2_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 3210
                },
                {
                    "id": "#fastp_unpaired1_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 3317
                },
                {
                    "id": "#fastp_read2_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 3424
                },
                {
                    "id": "#fastp_read2_adapter_sequence",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 3531
                },
                {
                    "id": "#fastp_read1_output_file_name",
                    "type": "string",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 3638
                },
                {
                    "id": "#fastp_read1_adapter_sequence",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 3745
                },
                {
                    "id": "#fastp_minimum_read_length",
                    "type": [
                        "null",
                        "int"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 3852
                },
                {
                    "id": "#fastp_json_output_file_name",
                    "type": "string",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 3959
                },
                {
                    "id": "#fastp_html_output_file_name",
                    "type": "string",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 4066
                },
                {
                    "id": "#fastp_failed_reads_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 4173
                },
                {
                    "id": "#bwa_mem_Y",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "doc": "use soft clipping for supplementary alignments",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 4601
                },
                {
                    "id": "#bwa_mem_T",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "minimum score to output [30]",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 4708
                },
                {
                    "id": "#sort_order",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 214
                },
                {
                    "id": "#bwa_mem_P",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "doc": "skip pairing; mate rescue performed unless -S also in use",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 4815
                },
                {
                    "id": "#picard_addRG_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1712
                },
                {
                    "id": "#bwa_mem_output",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 4922
                },
                {
                    "id": "#bwa_mem_M",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "doc": "mark shorter split hits as secondary",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 5029
                },
                {
                    "id": "#bwa_mem_K",
                    "type": [
                        "null",
                        "int"
                    ],
                    "doc": "process INT input bases in each batch regardless of nThreads (for reproducibility) []",
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 5136
                },
                {
                    "id": "#create_bam_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 1429.1021728515625,
                    "https://www.sevenbridges.com/y": 2675
                },
                {
                    "id": "#gatk_merge_bam_alignment_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 2354
                },
                {
                    "id": "#optical_duplicate_pixel_distance",
                    "type": [
                        "null",
                        "int"
                    ],
                    "https://www.sevenbridges.com/x": 1986.7406005859375,
                    "https://www.sevenbridges.com/y": 2135
                },
                {
                    "id": "#duplicate_scoring_strategy",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 1986.7406005859375,
                    "https://www.sevenbridges.com/y": 3108
                },
                {
                    "id": "#read_name_regex",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 963
                },
                {
                    "id": "#gatk_mark_duplicates_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 1986.7406005859375,
                    "https://www.sevenbridges.com/y": 2526
                },
                {
                    "id": "#gatk_mark_duplicates_duplication_metrics_file_name",
                    "type": "string",
                    "https://www.sevenbridges.com/x": 1986.7406005859375,
                    "https://www.sevenbridges.com/y": 2633
                },
                {
                    "id": "#gatk_mark_duplicates_assume_sort_order",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 1986.7406005859375,
                    "https://www.sevenbridges.com/y": 2740
                },
                {
                    "id": "#abra2_window_size",
                    "type": [
                        "null",
                        "string"
                    ],
                    "doc": "Processing window size and overlap",
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 2654.5
                },
                {
                    "id": "#abra2_soft_clip_contig",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 2761.5
                },
                {
                    "id": "#abra2_scoring_gap_alignments",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 2868.5
                },
                {
                    "id": "#abra2_output_bams",
                    "type": [
                        "string",
                        {
                            "type": "array",
                            "items": "string"
                        }
                    ],
                    "doc": "Required list of output sam or bam file",
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 2975.5
                },
                {
                    "id": "#abra2_maximum_average_depth",
                    "type": [
                        "null",
                        "int"
                    ],
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 3403.5
                },
                {
                    "id": "#abra2_bam_index",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 3724.5
                },
                {
                    "id": "#abra2_contig_anchor",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 3510.5
                },
                {
                    "id": "#abra2_consensus_sequence",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 3617.5
                },
                {
                    "id": "#bedtools_merge_distance_between_features",
                    "type": [
                        "null",
                        "int"
                    ],
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 2053.5
                },
                {
                    "id": "#abra2_maximum_mixmatch_rate",
                    "type": [
                        "null",
                        "float"
                    ],
                    "doc": "max allowed mismatch rate when mapping\nreads back to contigs (default: 0.05)",
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 3296.5
                },
                {
                    "id": "#bedtools_genomecov_option_bedgraph",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 2160.5
                },
                {
                    "id": "#picard_fixmateinformation_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1605
                },
                {
                    "id": "#abra2_no_sort",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 3082.5
                },
                {
                    "id": "#abra2_no_edge_complex_indel",
                    "type": [
                        "null",
                        "boolean"
                    ],
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 3189.5
                },
                {
                    "id": "#gatk_bqsr_read_filter",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "string",
                            "inputBinding": {
                                "prefix": "--read-filter"
                            }
                        }
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 2461
                },
                {
                    "id": "#gatk_base_recalibrator_known_sites",
                    "type": {
                        "type": "array",
                        "items": "File",
                        "inputBinding": {
                            "prefix": "--known-sites"
                        }
                    },
                    "secondaryFiles": [
                        ".idx"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 2675
                },
                {
                    "id": "#gatk_bqsr_disable_read_filter",
                    "type": [
                        "null",
                        {
                            "type": "array",
                            "items": "string",
                            "inputBinding": {
                                "prefix": "--disable-read-filter"
                            }
                        }
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 2568
                },
                {
                    "id": "#base_recalibrator_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 5243
                },
                {
                    "id": "#apply_bqsr_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 3224.2060546875,
                    "https://www.sevenbridges.com/y": 2854.5
                },
                {
                    "id": "#merge_sam_files_sort_order",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 1819
                },
                {
                    "id": "#gatk_merge_sam_files_output_file_name",
                    "type": [
                        "null",
                        "string"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 2247
                },
                {
                    "id": "#bwa_number_of_threads",
                    "type": [
                        "null",
                        "int"
                    ],
                    "https://www.sevenbridges.com/x": 0,
                    "https://www.sevenbridges.com/y": 4494
                },
                {
                    "id": "#fgbio_fastq_to_bam_input",
                    "type": {
                        "type": "array",
                        "items": {
                            "items": "File",
                            "type": "array"
                        }
                    },
                    "https://www.sevenbridges.com/x": 203.61305236816406,
                    "https://www.sevenbridges.com/y": 2992.899658203125
                }
            ],
            "outputs": [
                {
                    "id": "#gatk_sam_to_fastq_unpaired_fastq",
                    "outputSource": [
                        "#gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_unpaired_fastq"
                    ],
                    "type": [
                        "null",
                        "File"
                    ],
                    "https://www.sevenbridges.com/x": 1986.7406005859375,
                    "https://www.sevenbridges.com/y": 2242
                },
                {
                    "id": "#fastp_unpaired2_output",
                    "outputSource": [
                        "#fastp_0_20_1/fastp_unpaired2_output"
                    ],
                    "type": [
                        "null",
                        "File"
                    ],
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 1625.5
                },
                {
                    "id": "#fastp_unpaired1_output",
                    "outputSource": [
                        "#fastp_0_20_1/fastp_unpaired1_output"
                    ],
                    "type": [
                        "null",
                        "File"
                    ],
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 1732.5
                },
                {
                    "id": "#fastp_json_output",
                    "outputSource": [
                        "#fastp_0_20_1/fastp_json_output"
                    ],
                    "type": "File",
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 1839.5
                },
                {
                    "id": "#fastp_html_output",
                    "outputSource": [
                        "#fastp_0_20_1/fastp_html_output"
                    ],
                    "type": "File",
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 1946.5
                },
                {
                    "id": "#picard_mark_duplicates_metrics",
                    "outputSource": [
                        "#picard_mark_duplicates_4_1_8_1/picard_mark_duplicates_metrics"
                    ],
                    "type": "File",
                    "https://www.sevenbridges.com/x": 3224.2060546875,
                    "https://www.sevenbridges.com/y": 2388.5
                },
                {
                    "id": "#indel_realignment_bam",
                    "outputSource": [
                        "#indel_realignment/indel_realignment_bam"
                    ],
                    "type": "File",
                    "doc": "This bam file will be used for collapsing",
                    "secondaryFiles": [
                        "^.bai?"
                    ],
                    "https://www.sevenbridges.com/x": 3820.9111328125,
                    "https://www.sevenbridges.com/y": 2519
                },
                {
                    "id": "#uncollapsed_bam",
                    "outputSource": [
                        "#base_quality_recalibration/gatk_apply_bqsr_bam"
                    ],
                    "type": [
                        "null",
                        "File"
                    ],
                    "doc": "This is the uncollapsed bam used for SV and MSI",
                    "secondaryFiles": [
                        "^.bai?"
                    ],
                    "https://www.sevenbridges.com/x": 4307.6748046875,
                    "https://www.sevenbridges.com/y": 2568
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_txt",
                    "outputSource": [
                        "#gatk_collect_alignment_summary_metrics_4_1_8_0/gatk_collect_alignment_summary_metrics_txt"
                    ],
                    "type": "File",
                    "https://www.sevenbridges.com/x": 4708.2373046875,
                    "https://www.sevenbridges.com/y": 2621.5
                }
            ],
            "steps": [
                {
                    "id": "#fgbio_fastq_to_bam_1_2_0",
                    "in": [
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/input",
                            "source": [
                                "#fgbio_fastq_to_bam_input"
                            ]
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/output_file_name",
                            "source": "#fgbio_fastq_to_bam_output_file_name"
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/read-structures",
                            "source": [
                                "#read-structures"
                            ]
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/sort",
                            "source": "#fgbio_fastq_to_bam_sort"
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/umi-tag",
                            "source": "#fgbio_fastq_to_bam_umi-tag"
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/read-group-id",
                            "source": "#read-group-id"
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/sample",
                            "source": "#sample"
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/library",
                            "source": "#library"
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/platform",
                            "source": "#platform"
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/platform-unit",
                            "source": "#platform-unit"
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/platform-model",
                            "source": "#platform-model"
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/sequencing-center",
                            "source": "#sequencing-center"
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/predicted-insert-size",
                            "source": "#fgbio_fastq_to_bam_predicted-insert-size"
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/description",
                            "source": "#description"
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/comment",
                            "source": "#comment"
                        },
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/run-date",
                            "source": "#run-date"
                        }
                    ],
                    "out": [
                        {
                            "id": "#fgbio_fastq_to_bam_1_2_0/fgbio_fastq_to_bam_ubam"
                        }
                    ],
                    "run": "#fgbio_fastq_to_bam_1.2.0.cwl",
                    "label": "fgbio_fastq_to_bam_1.2.0",
                    "scatter": [
                        "#fgbio_fastq_to_bam_1_2_0/input"
                    ],
                    "scatterMethod": "dotproduct",
                    "https://www.sevenbridges.com/x": 477.953125,
                    "https://www.sevenbridges.com/y": 2516.5
                },
                {
                    "id": "#gatk_sam_to_fastq_4_1_8_0",
                    "in": [
                        {
                            "id": "#gatk_sam_to_fastq_4_1_8_0/fastq",
                            "source": "#R1_output_fastq"
                        },
                        {
                            "id": "#gatk_sam_to_fastq_4_1_8_0/input",
                            "source": "#gatk_merge_sam_files_4_1_8_0/gatk_merge_sam_files_bam"
                        },
                        {
                            "id": "#gatk_sam_to_fastq_4_1_8_0/include_non_pf_reads",
                            "source": "#gatk_sam_to_fastq_include_non_pf_reads"
                        },
                        {
                            "id": "#gatk_sam_to_fastq_4_1_8_0/include_non_primary_alignments",
                            "source": "#gatk_sam_to_fastq_include_non_primary_alignments"
                        },
                        {
                            "id": "#gatk_sam_to_fastq_4_1_8_0/reference_sequence",
                            "source": "#reference_sequence"
                        },
                        {
                            "id": "#gatk_sam_to_fastq_4_1_8_0/second_end_fastq",
                            "source": "#R2_output_fastq"
                        },
                        {
                            "id": "#gatk_sam_to_fastq_4_1_8_0/unpaired_fastq",
                            "source": "#unpaired_fastq_file"
                        },
                        {
                            "id": "#gatk_sam_to_fastq_4_1_8_0/validation_stringency",
                            "source": "#validation_stringency"
                        }
                    ],
                    "out": [
                        {
                            "id": "#gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_fastq"
                        },
                        {
                            "id": "#gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_unpaired_fastq"
                        },
                        {
                            "id": "#gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_second_end_fastq"
                        }
                    ],
                    "run": "#gatk_sam_to_fastq_4.1.8.0.cwl",
                    "label": "GATK-SamToFastq",
                    "https://www.sevenbridges.com/x": 1429.1021728515625,
                    "https://www.sevenbridges.com/y": 2519
                },
                {
                    "id": "#fastp_0_20_1",
                    "in": [
                        {
                            "id": "#fastp_0_20_1/read1_input",
                            "source": "#gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_fastq"
                        },
                        {
                            "id": "#fastp_0_20_1/read1_output_path",
                            "source": "#fastp_read1_output_file_name"
                        },
                        {
                            "id": "#fastp_0_20_1/read2_input",
                            "source": "#gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_second_end_fastq"
                        },
                        {
                            "id": "#fastp_0_20_1/read2_output_path",
                            "source": "#fastp_read2_output_file_name"
                        },
                        {
                            "id": "#fastp_0_20_1/unpaired1_path",
                            "source": "#fastp_unpaired1_output_file_name"
                        },
                        {
                            "id": "#fastp_0_20_1/unpaired2_path",
                            "source": "#fastp_unpaired2_output_file_name"
                        },
                        {
                            "id": "#fastp_0_20_1/failed_reads_path",
                            "source": "#fastp_failed_reads_output_file_name"
                        },
                        {
                            "id": "#fastp_0_20_1/read1_adapter_sequence",
                            "source": "#fastp_read1_adapter_sequence"
                        },
                        {
                            "id": "#fastp_0_20_1/read2_adapter_sequence",
                            "source": "#fastp_read2_adapter_sequence"
                        },
                        {
                            "id": "#fastp_0_20_1/minimum_read_length",
                            "source": "#fastp_minimum_read_length"
                        },
                        {
                            "id": "#fastp_0_20_1/json_output_path",
                            "source": "#fastp_json_output_file_name"
                        },
                        {
                            "id": "#fastp_0_20_1/html_output_path",
                            "source": "#fastp_html_output_file_name"
                        }
                    ],
                    "out": [
                        {
                            "id": "#fastp_0_20_1/fastp_json_output"
                        },
                        {
                            "id": "#fastp_0_20_1/fastp_html_output"
                        },
                        {
                            "id": "#fastp_0_20_1/fastp_read1_output"
                        },
                        {
                            "id": "#fastp_0_20_1/fastp_read2_output"
                        },
                        {
                            "id": "#fastp_0_20_1/fastp_unpaired1_output"
                        },
                        {
                            "id": "#fastp_0_20_1/fastp_unpaired2_output"
                        }
                    ],
                    "run": "#fastp_0.20.1.cwl",
                    "label": "fastp_0.20.1",
                    "https://www.sevenbridges.com/x": 1986.7406005859375,
                    "https://www.sevenbridges.com/y": 2924
                },
                {
                    "id": "#alignment",
                    "in": [
                        {
                            "id": "#alignment/create_bam_index",
                            "source": "#create_bam_index"
                        },
                        {
                            "id": "#alignment/output_file_name",
                            "source": "#picard_addRG_output_file_name"
                        },
                        {
                            "id": "#alignment/read_group_description",
                            "source": "#description"
                        },
                        {
                            "id": "#alignment/read_group_identifier",
                            "source": "#read-group-id"
                        },
                        {
                            "id": "#alignment/read_group_library",
                            "source": "#library"
                        },
                        {
                            "id": "#alignment/read_group_platform_unit",
                            "source": "#platform-unit"
                        },
                        {
                            "id": "#alignment/read_group_run_date",
                            "source": "#run-date"
                        },
                        {
                            "id": "#alignment/read_group_sample_name",
                            "source": "#sample"
                        },
                        {
                            "id": "#alignment/read_group_sequencing_center",
                            "source": "#sequencing-center"
                        },
                        {
                            "id": "#alignment/read_group_sequencing_platform",
                            "source": "#platform"
                        },
                        {
                            "id": "#alignment/sort_order",
                            "source": "#sort_order"
                        },
                        {
                            "id": "#alignment/validation_stringency",
                            "source": "#validation_stringency"
                        },
                        {
                            "id": "#alignment/reference",
                            "source": "#reference_sequence"
                        },
                        {
                            "id": "#alignment/reads",
                            "source": [
                                "#fastp_0_20_1/fastp_read1_output",
                                "#fastp_0_20_1/fastp_read2_output"
                            ]
                        },
                        {
                            "id": "#alignment/output",
                            "source": "#bwa_mem_output"
                        },
                        {
                            "id": "#alignment/P",
                            "source": "#bwa_mem_P"
                        },
                        {
                            "id": "#alignment/M",
                            "source": "#bwa_mem_M"
                        },
                        {
                            "id": "#alignment/T",
                            "source": "#bwa_mem_T"
                        },
                        {
                            "id": "#alignment/Y",
                            "source": "#bwa_mem_Y"
                        },
                        {
                            "id": "#alignment/K",
                            "source": "#bwa_mem_K"
                        },
                        {
                            "id": "#alignment/bwa_number_of_threads",
                            "source": "#bwa_number_of_threads"
                        }
                    ],
                    "out": [
                        {
                            "id": "#alignment/picard_add_or_replace_read_groups_bam"
                        }
                    ],
                    "run": "#alignment.cwl",
                    "label": "alignment",
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 2407.5
                },
                {
                    "id": "#gatk_merge_bam_alignment_4_1_8_0",
                    "in": [
                        {
                            "id": "#gatk_merge_bam_alignment_4_1_8_0/unmapped_bam",
                            "source": "#gatk_merge_sam_files_4_1_8_0/gatk_merge_sam_files_bam"
                        },
                        {
                            "id": "#gatk_merge_bam_alignment_4_1_8_0/reference",
                            "source": "#reference_sequence"
                        },
                        {
                            "id": "#gatk_merge_bam_alignment_4_1_8_0/output_file_name",
                            "source": "#gatk_merge_bam_alignment_output_file_name"
                        },
                        {
                            "id": "#gatk_merge_bam_alignment_4_1_8_0/aligned_bam",
                            "source": [
                                "#alignment/picard_add_or_replace_read_groups_bam"
                            ],
                            "valueFrom": "${ return [ self ]; }"
                        },
                        {
                            "id": "#gatk_merge_bam_alignment_4_1_8_0/validation_stringency",
                            "source": "#validation_stringency"
                        },
                        {
                            "id": "#gatk_merge_bam_alignment_4_1_8_0/create_index",
                            "source": "#create_bam_index"
                        }
                    ],
                    "out": [
                        {
                            "id": "#gatk_merge_bam_alignment_4_1_8_0/gatk_merge_bam_alignment_bam"
                        }
                    ],
                    "run": "#gatk_merge_bam_alignment_4.1.8.0.cwl",
                    "label": "GATK-MergeBamAlignment",
                    "https://www.sevenbridges.com/x": 1986.7406005859375,
                    "https://www.sevenbridges.com/y": 2384
                },
                {
                    "id": "#picard_mark_duplicates_4_1_8_1",
                    "in": [
                        {
                            "id": "#picard_mark_duplicates_4_1_8_1/input",
                            "source": "#gatk_merge_bam_alignment_4_1_8_0/gatk_merge_bam_alignment_bam"
                        },
                        {
                            "id": "#picard_mark_duplicates_4_1_8_1/output_file_name",
                            "source": "#gatk_mark_duplicates_output_file_name"
                        },
                        {
                            "id": "#picard_mark_duplicates_4_1_8_1/duplication_metrics",
                            "source": "#gatk_mark_duplicates_duplication_metrics_file_name"
                        },
                        {
                            "id": "#picard_mark_duplicates_4_1_8_1/assume_sort_order",
                            "source": "#gatk_mark_duplicates_assume_sort_order"
                        },
                        {
                            "id": "#picard_mark_duplicates_4_1_8_1/validation_stringency",
                            "source": "#validation_stringency"
                        },
                        {
                            "id": "#picard_mark_duplicates_4_1_8_1/create_bam_index",
                            "source": "#create_bam_index"
                        },
                        {
                            "id": "#picard_mark_duplicates_4_1_8_1/read_name_regex",
                            "source": "#read_name_regex"
                        },
                        {
                            "id": "#picard_mark_duplicates_4_1_8_1/duplicate_scoring_strategy",
                            "source": "#duplicate_scoring_strategy"
                        },
                        {
                            "id": "#picard_mark_duplicates_4_1_8_1/optical_duplicate_pixel_distance",
                            "source": "#optical_duplicate_pixel_distance"
                        }
                    ],
                    "out": [
                        {
                            "id": "#picard_mark_duplicates_4_1_8_1/picard_mark_duplicates_bam"
                        },
                        {
                            "id": "#picard_mark_duplicates_4_1_8_1/picard_mark_duplicates_metrics"
                        }
                    ],
                    "run": "#picard_mark_duplicates_4.1.8.1.cwl",
                    "label": "picard_mark_duplicates_4.1.8.1",
                    "https://www.sevenbridges.com/x": 2471.26318359375,
                    "https://www.sevenbridges.com/y": 1462.5
                },
                {
                    "id": "#indel_realignment",
                    "in": [
                        {
                            "id": "#indel_realignment/window_size",
                            "source": "#abra2_window_size"
                        },
                        {
                            "id": "#indel_realignment/soft_clip_contig",
                            "source": "#abra2_soft_clip_contig"
                        },
                        {
                            "id": "#indel_realignment/scoring_gap_alignments",
                            "source": "#abra2_scoring_gap_alignments"
                        },
                        {
                            "id": "#indel_realignment/reference_fasta",
                            "source": "#reference_sequence"
                        },
                        {
                            "id": "#indel_realignment/no_sort",
                            "source": "#abra2_no_sort"
                        },
                        {
                            "id": "#indel_realignment/maximum_mixmatch_rate",
                            "source": "#abra2_maximum_mixmatch_rate"
                        },
                        {
                            "id": "#indel_realignment/maximum_average_depth",
                            "source": "#abra2_maximum_average_depth"
                        },
                        {
                            "id": "#indel_realignment/input_bam",
                            "source": [
                                "#picard_mark_duplicates_4_1_8_1/picard_mark_duplicates_bam"
                            ]
                        },
                        {
                            "id": "#indel_realignment/contig_anchor",
                            "source": "#abra2_contig_anchor"
                        },
                        {
                            "id": "#indel_realignment/consensus_sequence",
                            "source": "#abra2_consensus_sequence"
                        },
                        {
                            "id": "#indel_realignment/bam_index",
                            "source": "#abra2_bam_index"
                        },
                        {
                            "id": "#indel_realignment/option_bedgraph",
                            "source": "#bedtools_genomecov_option_bedgraph"
                        },
                        {
                            "id": "#indel_realignment/no_edge_complex_indel",
                            "source": "#abra2_no_edge_complex_indel"
                        },
                        {
                            "id": "#indel_realignment/distance_between_features",
                            "source": "#bedtools_merge_distance_between_features"
                        },
                        {
                            "id": "#indel_realignment/output_bams",
                            "source": [
                                "#abra2_output_bams"
                            ]
                        },
                        {
                            "id": "#indel_realignment/validation_stringency",
                            "source": "#validation_stringency"
                        },
                        {
                            "id": "#indel_realignment/sort_order",
                            "source": "#sort_order"
                        },
                        {
                            "id": "#indel_realignment/output_file_name",
                            "source": "#picard_fixmateinformation_output_file_name"
                        },
                        {
                            "id": "#indel_realignment/create_bam_index",
                            "source": "#create_bam_index"
                        }
                    ],
                    "out": [
                        {
                            "id": "#indel_realignment/indel_realignment_bam"
                        }
                    ],
                    "run": "#indel_realignment.cwl",
                    "label": "indel_realignment",
                    "https://www.sevenbridges.com/x": 3224.2060546875,
                    "https://www.sevenbridges.com/y": 2621.5
                },
                {
                    "id": "#base_quality_recalibration",
                    "in": [
                        {
                            "id": "#base_quality_recalibration/input",
                            "source": "#indel_realignment/indel_realignment_bam"
                        },
                        {
                            "id": "#base_quality_recalibration/reference",
                            "source": "#reference_sequence"
                        },
                        {
                            "id": "#base_quality_recalibration/read_filter",
                            "source": [
                                "#gatk_bqsr_read_filter"
                            ]
                        },
                        {
                            "id": "#base_quality_recalibration/known_sites",
                            "source": [
                                "#gatk_base_recalibrator_known_sites"
                            ]
                        },
                        {
                            "id": "#base_quality_recalibration/base_recalibrator_output_file_name",
                            "source": "#base_recalibrator_output_file_name"
                        },
                        {
                            "id": "#base_quality_recalibration/disable_read_filter",
                            "source": [
                                "#gatk_bqsr_disable_read_filter"
                            ]
                        },
                        {
                            "id": "#base_quality_recalibration/apply_bqsr_create_output_bam_index",
                            "source": "#create_bam_index"
                        },
                        {
                            "id": "#base_quality_recalibration/apply_bqsr_output_file_name",
                            "source": "#apply_bqsr_output_file_name"
                        }
                    ],
                    "out": [
                        {
                            "id": "#base_quality_recalibration/gatk_apply_bqsr_bam"
                        }
                    ],
                    "run": "#base_quality_recalibration.cwl",
                    "label": "base_quality_recalibration",
                    "https://www.sevenbridges.com/x": 3820.9111328125,
                    "https://www.sevenbridges.com/y": 2675
                },
                {
                    "id": "#gatk_collect_alignment_summary_metrics_4_1_8_0",
                    "in": [
                        {
                            "id": "#gatk_collect_alignment_summary_metrics_4_1_8_0/input",
                            "source": "#base_quality_recalibration/gatk_apply_bqsr_bam"
                        }
                    ],
                    "out": [
                        {
                            "id": "#gatk_collect_alignment_summary_metrics_4_1_8_0/gatk_collect_alignment_summary_metrics_txt"
                        }
                    ],
                    "run": "#gatk_collect_alignment_summary_metrics_4.1.8.0.cwl",
                    "label": "GATK-CollectAlignmentSummaryMetrics",
                    "https://www.sevenbridges.com/x": 4307.6748046875,
                    "https://www.sevenbridges.com/y": 2675
                },
                {
                    "id": "#gatk_merge_sam_files_4_1_8_0",
                    "in": [
                        {
                            "id": "#gatk_merge_sam_files_4_1_8_0/input",
                            "source": [
                                "#fgbio_fastq_to_bam_1_2_0/fgbio_fastq_to_bam_ubam"
                            ]
                        },
                        {
                            "id": "#gatk_merge_sam_files_4_1_8_0/output_file_name",
                            "source": "#gatk_merge_sam_files_output_file_name"
                        },
                        {
                            "id": "#gatk_merge_sam_files_4_1_8_0/reference_sequence",
                            "source": "#reference_sequence"
                        },
                        {
                            "id": "#gatk_merge_sam_files_4_1_8_0/sort_order",
                            "source": "#merge_sam_files_sort_order"
                        },
                        {
                            "id": "#gatk_merge_sam_files_4_1_8_0/validation_stringency",
                            "source": "#validation_stringency"
                        }
                    ],
                    "out": [
                        {
                            "id": "#gatk_merge_sam_files_4_1_8_0/gatk_merge_sam_files_bam"
                        }
                    ],
                    "run": "#gatk_merge_sam_files_4.1.8.0.cwl",
                    "label": "GATK-MergeSamFiles",
                    "https://www.sevenbridges.com/x": 1025.4615478515625,
                    "https://www.sevenbridges.com/y": 2593.5
                }
            ],
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                },
                {
                    "class": "ScatterFeatureRequirement"
                },
                {
                    "class": "MultipleInputFeatureRequirement"
                },
                {
                    "class": "StepInputExpressionRequirement"
                },
                {
                    "class": "InlineJavascriptRequirement"
                }
            ],
            "https://schema.org/author": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:shahr2@mskcc.org",
                    "https://schema.org/identifier": "",
                    "https://schema.org/name": "Ronak Shah"
                }
            ],
            "https://schema.org/citation": "",
            "https://schema.org/codeRepository": "https://github.com/msk-access/standard_bam_processing",
            "https://schema.org/contributor": [
                {
                    "class": "https://schema.org/Person",
                    "https://schema.org/email": "mailto:shahr2@mskcc.org",
                    "https://schema.org/identifier": "https://orcid.org/0000-0001-9042-6213",
                    "https://schema.org/name": "Ronak Shah"
                }
            ],
            "https://schema.org/dateCreated": "2020-09-23",
            "https://schema.org/license": "https://spdx.org/licenses/Apache-2.0"
        }
    ],
    "cwlVersion": "v1.0",
    "$schemas": [
        "http://schema.org/version/9.0/schemaorg-current-http.rdf"
    ]
}