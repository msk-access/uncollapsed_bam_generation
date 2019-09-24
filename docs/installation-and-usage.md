---
description: How to install and run the workflow
---

# Installation and Usage

## Using [cwltool](https://github.com/common-workflow-language/cwltool)

#### Step 1: Create a virtual environment using python 3.7.

Here we can use either [virtualenv](https://virtualenv.pypa.io/) or [conda](https://docs.conda.io/en/latest/). Here we will use virtualenv.

```text
[server]$ pip3 install virtualenv
[server]$ virtaulenv my_project
[server]$ source standard_bam_processing/bin/activate
```

#### Step 2: Clone the repository

```
(my_project)[server]$ git clone --recursive https://github.com/msk-access/standard_bam_processing.git
(my_project)[server]$ cd standard_bam_processing
(my_project)[server]$ git submodule update --recursive --remote
```

#### Step 3: Install requirements using pip

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

#### Step 4: Run the workflow with a given set of input using cwltool

```
(my_project)[server]$ cwltool standard_bam_processing.cwl inputs.yaml
```



