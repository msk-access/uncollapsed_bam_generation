# Quick Start

## Running the ACCESS standard bam workflow

### Step 1 -  Clone the project from GitHub:

```text
$ git clone --recursive https://github.com/msk-access/standard_bam_processing.git
```

### Step 2 - Install Toil and cwltool

```text
$ pip install toil-ionox0'[cwl]'==0.0.7
```

Note: you may use any CWL executor available, provided it works with your batch system

### Step 3 - Generate an inputs file

Using either json or yaml format, following these specifications:

{% page-ref page="inputs-description.md" %}

It's also possible to create a "template" inputs file to be filled in using this command:

```text
$ cwltool --make-template ~/standard_bam_processing.cwl > inputs.yaml
```

### Step 4 - Run the workflow with a CWL executor:

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

