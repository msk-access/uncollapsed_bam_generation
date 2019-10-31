# Requirements

Before [Installation](installation-and-usage.md) of the pipeline, make sure your system supports these requirements

Following are the requirements for running the workflow:

* A system with either [docker](https://www.docker.com/) or [singularity](https://sylabs.io/docs/) configured. 
* Python 3.7 \(for running [cwltool](https://github.com/common-workflow-language/cwltool)\)
  * Python Packages \(will be installed as part of pipeline installation\):
    * toil-ionox0\[cwl\]==0.0.7 
    * pytz typing==3.7.4
    * ruamel.yaml==0.15.77 
    * pip==18.1 
    * bumpversion==0.5.3 
    * wheel==0.32.1 
    * watchdog==0.9.0 
    * flake8==3.5.0 
    * tox==3.5.2 
    * coverage==4.5.1
    * twine==1.12.1 
    * pytest==3.8.2 
    * pytest-runner==4.2
* Python 2.7 \(for running [toil-cwl-runner](https://toil.readthedocs.io/en/latest/running/introduction.html)\)
* Python Virtual Environment using [virtualenv](https://virtualenv.pypa.io/) or [conda](https://docs.conda.io/en/latest/).

