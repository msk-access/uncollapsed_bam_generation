---
description: How to install and run the workflow
---

# Installation and Usage

{% tabs %}
{% tab title="Using cwltool" %}
Here we show how to use [cwltool](https://github.com/common-workflow-language/cwltool) to run the workflow on single machine

## Step 1: Create a virtual environment using python 3.7.

Here we can use either [virtualenv](https://virtualenv.pypa.io/) or [conda](https://docs.conda.io/en/latest/). Here we will use virtualenv.

```text
[server]$ pip3 install virtualenv
[server]$ virtaulenv my_project
[server]$ source standard_bam_processing/bin/activate
```

## Step 2: Clone the repository

```text
(my_project)[server]$ git clone --recursive https://github.com/msk-access/standard_bam_processing.git
(my_project)[server]$ cd standard_bam_processing
(my_project)[server]$ git submodule update --recursive --remote
```

## Step 3: Install requirements using pip

We have already specified the version of cwltool and other packages in the requirements.txt file. Please use this to install.

```text
(my_project)[server]$ pip install -r requirements.txt
```

{% hint style="success" %}
Super-powers are granted randomly so please submit an issue if you're not happy with yours.
{% endhint %}

{% hint style="info" %}
To see help for the inputs for cwl workflow you can use:

`cwltool standard_bam_processing.cwl --help`
{% endhint %}

Once we have successfully installed the requirements we can now run the workflow using _cwltool_ if you have proper input file generated either in [json](https://www.json.org/) or [yaml](https://yaml.org/) format. Please look at [Inputs Description](inputs-description.md) for more details.

## Step 4: Run the workflow with a given set of input using [cwltool](https://github.com/common-workflow-language/cwltool) on single machine

```text
(my_project)[server]$ cwltool standard_bam_processing.cwl inputs.yaml
```
{% endtab %}

{% tab title="Using toil-cwl-runner locally" %}
Here we show how to run the workflow using [toil-cwl-runner](https://toil.readthedocs.io/en/latest/running/introduction.html) using single machine interface.

## Step 1: Create a virtual environment using python 3.7.

Here we can use either [virtualenv](https://virtualenv.pypa.io/) or [conda](https://docs.conda.io/en/latest/). Here we will use virtualenv.

```text
[server]$ pip3 install virtualenv
[server]$ virtaulenv my_project
[server]$ source standard_bam_processing/bin/activate
```

## Step 2: Clone the repository

```text
(my_project)[server]$ git clone --recursive https://github.com/msk-access/standard_bam_processing.git
(my_project)[server]$ cd standard_bam_processing
(my_project)[server]$ git submodule update --recursive --remote
```

## Step 3: Install requirements using pip

We have already specified the version of cwltool and other packages in the requirements.txt file. Please use this to install.

```text
(my_project)[server]$ pip install -r requirements.txt
```

{% hint style="success" %}
Super-powers are granted randomly so please submit an issue if you're not happy with yours.
{% endhint %}

{% hint style="info" %}
To see help for the inputs for cwl workflow you can use:

`toil-cwl-runner standard_bam_processing.cwl --help`
{% endhint %}

Once we have successfully installed the requirements we can now run the workflow using _cwltool_ if you have proper input file generated either in [json](https://www.json.org/) or [yaml](https://yaml.org/) format. Please look at [Inputs Description](inputs-description.md) for more details.

## Step 4: Run the workflow with a given set of input using [toil](https://toil.readthedocs.io/en/latest/running/introduction.html) on single machine

```text
(my_project)[server]$ toil-cwl-runner standard_bam_processing.cwl inputs.yaml
```
{% endtab %}

{% tab title="Using toil-cwl-runner on JUNO" %}
Here we show how to run the workflow using [toil-cwl-runner](https://toil.readthedocs.io/en/latest/running/introduction.html) on MSKCC internal compute cluster called JUNO which has [IBM LSF](https://www.ibm.com/support/knowledgecenter/en/SSETD4/product_welcome_platform_lsf.html) as a scheduler.

## Step 1: Create a virtual environment using python 3.7.

Here we can use either [virtualenv](https://virtualenv.pypa.io/) or [conda](https://docs.conda.io/en/latest/). Here we will use virtualenv.

```text
[server]$ pip3 install virtualenv
[server]$ virtaulenv my_project
[server]$ source standard_bam_processing/bin/activate
```

## Step 2: Clone the repository

```text
(my_project)[server]$ git clone --recursive https://github.com/msk-access/standard_bam_processing.git
(my_project)[server]$ cd standard_bam_processing
(my_project)[server]$ git submodule update --recursive --remote
```

## Step 3: Install requirements using pip

We have already specified the version of cwltool and other packages in the requirements.txt file. Please use this to install.

```text
(my_project)[server]$ pip install -r requirements.txt
```

{% hint style="success" %}
Super-powers are granted randomly so please submit an issue if you're not happy with yours.
{% endhint %}

{% hint style="info" %}
To see help for the inputs for cwl workflow you can use:

`toil-cwl-runner standard_bam_processing.cwl --help`
{% endhint %}

Once we have successfully installed the requirements we can now run the workflow using _cwltool_ if you have proper input file generated either in [json](https://www.json.org/) or [yaml](https://yaml.org/) format. Please look at [Inputs Description](inputs-description.md) for more details.

## Step 4: Run the workflow with a given set of input using [toil](https://toil.readthedocs.io/en/latest/running/introduction.html) on JUNO \(MSKCC Research Cluster\)

```text
(my_project)[server]$ TMPDIR=$PWD
(my_project)[server]$ TOIL_LSF_ARGS='-W 3600'
(my_project)[server]$ toil-cwl-runner \
                          --singularity \
                          --logFile /path/to/toil_log/cwltoil.log  \
                          --jobStore /path/to/jobStore \
                          --batchSystem lsf \
                          --workDir /path/to/toil_log \
                          --outdir $PWD \
                          --writeLogs /path/to/toil_log \
                          --logLevel DEBUG \
                          --stats \
                          --retryCount 2 
                          --disableCaching \
                          --disableChaining \
                          --maxLogFileSize 20000000000 \
                          --cleanWorkDir onSuccess
                          --preserve-environment PATH PYTHONPATH TOIL_LSF_ARGS \
                          TMPDIR _JAVA_OPTIONS
                          /path/to/standard_bam_processing.cwl \
                          /path/to/inputs.yaml \
                          > toil.stdout \
                          2> toil.stderr &
```
{% endtab %}
{% endtabs %}

