---
description: >-
  GATK Best Practices pipeline for producing genomic alignment files from
  compressed Fastq files
---

# Standard Bam Processing

This is the workflow is written using Common Workflow Language \(CWL\) version 1.0 \([https://www.commonwl.org/v1.0/](https://www.commonwl.org/v1.0/)\) and is used at Memorial Sloan Kettering Cancer Center for producing standard bam files from the NY state-approved MSK-ACCESS assay.

It is meant to be run on a single sample paired-end read 1 and read 2 fastq's, from Illumina sequencing data, but may be generalizable to other sequencing platforms and sequencing panels as well, which produce pair-end data.

!\[Alt text\]\([https://g.gravizo.com/svg?](https://g.gravizo.com/svg?) digraph {compound=true "standard\_bam\_processing.cwl\#trim\_galore\_0\_6\_2" \[label="trim\_galore\_0\_6\_2"\] "standard\_bam\_processing.cwl\#picard\_mark\_duplicates\_2\_8\_1" \[label="picard\_mark\_duplicates\_2\_8\_1"\] "standard\_bam\_processing.cwl\#picard\_collect\_alignment\_summary\_metrics\_2\_8\_1" \[label="picard\_collect\_alignment\_summary\_metrics\_2\_8\_1"\] subgraph "cluster\_abra\_fx.cwl" { label="abra\_fx.cwl" "abra\_fx.cwl\#picard\_fix\_mate\_information\_1\_97" \[label="picard\_fix\_mate\_information\_1\_97"\] "abra\_fx.cwl\#bedtools\_merge" \[label="bedtools\_merge"\] "abra\_fx.cwl\#abra2\_2\_18" \[label="abra2\_2\_18"\] "abra\_fx.cwl\#bedtools\_genomecov" \[label="bedtools\_genomecov"\] } subgraph "cluster\_alignment.cwl" { label="alignment.cwl" "alignment.cwl\#bwa\_mem\_0\_7\_5a" \[label="bwa\_mem\_0\_7\_5a"\] "alignment.cwl\#picard\_add\_or\_replace\_read\_groups\_1\_96" \[label="picard\_add\_or\_replace\_read\_groups\_1\_96"\] } subgraph "cluster\_calculate\_apply\_bqsr.cwl" { label="calculate\_apply\_bqsr.cwl" "calculate\_apply\_bqsr.cwl\#gatk\_apply\_bqsr\_4\_1\_2\_1" \[label="gatk\_apply\_bqsr\_4\_1\_2\_1"\] "calculate\_apply\_bqsr.cwl\#gatk\_base\_recalibrator\_4\_1\_2\_1" \[label="gatk\_base\_recalibrator\_4\_1\_2\_1"\] } "abra\_fx.cwl\#abra2\_2\_18" -&gt; "abra\_fx.cwl\#picard\_fix\_mate\_information\_1\_97" \[\] "alignment.cwl\#bwa\_mem\_0\_7\_5a" -&gt; "alignment.cwl\#picard\_add\_or\_replace\_read\_groups\_1\_96" \[\] "calculate\_apply\_bqsr.cwl\#gatk\_apply\_bqsr\_4\_1\_2\_1" -&gt; "standard\_bam\_processing.cwl\#picard\_collect\_alignment\_summary\_metrics\_2\_8\_1" \[ltail="cluster\_calculate\_apply\_bqsr.cwl"\] "calculate\_apply\_bqsr.cwl\#gatk\_base\_recalibrator\_4\_1\_2\_1" -&gt; "calculate\_apply\_bqsr.cwl\#gatk\_apply\_bqsr\_4\_1\_2\_1" \[\] "abra\_fx.cwl\#bedtools\_genomecov" -&gt; "abra\_fx.cwl\#bedtools\_merge" \[\] "abra\_fx.cwl\#picard\_fix\_mate\_information\_1\_97" -&gt; "calculate\_apply\_bqsr.cwl\#gatk\_apply\_bqsr\_4\_1\_2\_1" \[ltail="cluster\_abra\_fx.cwl" lhead="cluster\_calculate\_apply\_bqsr.cwl"\] "abra\_fx.cwl\#bedtools\_merge" -&gt; "abra\_fx.cwl\#abra2\_2\_18" \[\] "standard\_bam\_processing.cwl\#picard\_mark\_duplicates\_2\_8\_1" -&gt; "abra\_fx.cwl\#picard\_fix\_mate\_information\_1\_97" \[ lhead="cluster\_abra\_fx.cwl"\] "standard\_bam\_processing.cwl\#trim\_galore\_0\_6\_2" -&gt; "alignment.cwl\#bwa\_mem\_0\_7\_5a" \[ lhead="cluster\_alignment.cwl"\] "alignment.cwl\#bwa\_mem\_0\_7\_5a" -&gt; "standard\_bam\_processing.cwl\#picard\_mark\_duplicates\_2\_8\_1" \[ltail="cluster\_alignment.cwl"\] } \)

![Workflow - as viewed from Rabix Composer](.gitbook/assets/screen-shot-2019-09-20-at-10.37.09-am-1.png)

{% page-ref page="quickstart.md" %}

