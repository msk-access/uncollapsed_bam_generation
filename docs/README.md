---
description: >-
  GATK Best Practices pipeline for producing genomic alignment files from
  compressed Fastq files
---

# Standard Bam Processing

This is the workflow is written using Common Workflow Language \(CWL\) version 1.0 \([https://www.commonwl.org/v1.0/](https://www.commonwl.org/v1.0/)\) and is used at Memorial Sloan Kettering Cancer Center for producing standard bam files from the NY state-approved MSK-ACCESS assay.

It is meant to be run on a single sample paired-end read 1 and read 2 fastq's, from Illumina sequencing data, but may be generalizable to other sequencing platforms and sequencing panels as well, which produce pair-end data.


<img src='https://g.gravizo.com/svg?
digraph {compound=true
"standard_bam_processing.cwl#trim_galore_0_6_2" [label="trim_galore_0_6_2"]
"standard_bam_processing.cwl#picard_mark_duplicates_2_8_1" [label="picard_mark_duplicates_2_8_1"]
"standard_bam_processing.cwl#picard_collect_alignment_summary_metrics_2_8_1" [label="picard_collect_alignment_summary_metrics_2_8_1"]
subgraph "cluster_abra_fx.cwl" { label="abra_fx.cwl"
"abra_fx.cwl#picard_fix_mate_information_1_97" [label="picard_fix_mate_information_1_97"]
"abra_fx.cwl#bedtools_merge" [label="bedtools_merge"]
"abra_fx.cwl#abra2_2_18" [label="abra2_2_18"]
"abra_fx.cwl#bedtools_genomecov" [label="bedtools_genomecov"]
}
subgraph "cluster_alignment.cwl" { label="alignment.cwl"
"alignment.cwl#bwa_mem_0_7_5a" [label="bwa_mem_0_7_5a"]
"alignment.cwl#picard_add_or_replace_read_groups_1_96" [label="picard_add_or_replace_read_groups_1_96"]
}
subgraph "cluster_calculate_apply_bqsr.cwl" { label="calculate_apply_bqsr.cwl"
"calculate_apply_bqsr.cwl#gatk_apply_bqsr_4_1_2_1" [label="gatk_apply_bqsr_4_1_2_1"]
"calculate_apply_bqsr.cwl#gatk_base_recalibrator_4_1_2_1" [label="gatk_base_recalibrator_4_1_2_1"]
}
"abra_fx.cwl#abra2_2_18" -> "abra_fx.cwl#picard_fix_mate_information_1_97" []
"alignment.cwl#bwa_mem_0_7_5a" -> "alignment.cwl#picard_add_or_replace_read_groups_1_96" []
"calculate_apply_bqsr.cwl#gatk_apply_bqsr_4_1_2_1" -> "standard_bam_processing.cwl#picard_collect_alignment_summary_metrics_2_8_1" [ltail="cluster_calculate_apply_bqsr.cwl"]
"calculate_apply_bqsr.cwl#gatk_base_recalibrator_4_1_2_1" -> "calculate_apply_bqsr.cwl#gatk_apply_bqsr_4_1_2_1" []
"abra_fx.cwl#bedtools_genomecov" -> "abra_fx.cwl#bedtools_merge" []
"abra_fx.cwl#picard_fix_mate_information_1_97" -> "calculate_apply_bqsr.cwl#gatk_apply_bqsr_4_1_2_1" [ltail="cluster_abra_fx.cwl" lhead="cluster_calculate_apply_bqsr.cwl"]
"abra_fx.cwl#bedtools_merge" -> "abra_fx.cwl#abra2_2_18" []
"standard_bam_processing.cwl#picard_mark_duplicates_2_8_1" -> "abra_fx.cwl#picard_fix_mate_information_1_97" [ lhead="cluster_abra_fx.cwl"]
"standard_bam_processing.cwl#trim_galore_0_6_2" -> "alignment.cwl#bwa_mem_0_7_5a" [ lhead="cluster_alignment.cwl"]
"alignment.cwl#bwa_mem_0_7_5a" -> "standard_bam_processing.cwl#picard_mark_duplicates_2_8_1" [ltail="cluster_alignment.cwl"]
}
'/>


![Workflow - as viewed from Rabix Composer](.gitbook/assets/screen-shot-2019-09-20-at-10.37.09-am%20%281%29.png)

{% page-ref page="quickstart.md" %}

