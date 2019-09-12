# Quick Start

## Running the ACCESS standard bam workflow

#### Step 1 -  Clone the project from GitHub:

```text
$ git clone --recursive https://github.com/msk-access/standard_bam_processing.git
```

#### Step 2 - Generate an inputs file 

Using either json or yaml format, following these specifications:

[https://app.gitbook.com/@msk-access/s/standard-bam-processing/v/develop/inputs-description](https://app.gitbook.com/@msk-access/s/standard-bam-processing/v/develop/inputs-description)

#### Step 3 - Run the workflow with a CWL executor:

```text
$ cwltool standard_bam_processing.cwl inputs.json
```

Or, to run the workflow on a HPC cluster using toil:

```text
$ toil-cwl-runner \
    --singularity \
    --jobStore my_jobStore \
    --batchSystem lsf \
    --workDir `pwd` \
    --outdir `pwd` \
    --logFile cwltoil.log \
    --writeLogs `pwd` \
    --logLevel DEBUG \
    --retryCount 2 \
    --disableCaching \
    --maxLogFileSize 20000000000 \
    --stats \
    standard_bam_processing.cwl \
    inputs.yaml
```

{% hint style="info" %}
**Note:** To see help for the inputs for any cwl workflow you can use:

$ cwltool standard\_bam\_processing.cwl --help
{% endhint %}



