#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""The setup script."""

from setuptools import setup, find_packages

with open('README.md') as readme_file:
    readme = readme_file.read()

requirements = ['toil[cwl]==5.5.0', ]

setup_requirements = ['pytest-runner', ]

test_requirements = ['pytest', ]

setup(
    author="Ian Johnson",
    author_email='johnsoni@mskcc.org',
    classifiers=[
        'Development Status :: 2 - Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: Apache Software License',
        'Natural Language :: English',
        'Programming Language :: Python :: 3.6',
    ],
    description="Workflow for making MSK-ACCESS standard binary alignment mapping file.",
    install_requires=requirements,
    license="Apache Software License 2.0",
    long_description=readme + '\n\n',
    include_package_data=True,
    keywords='uncollapsed_bam_generation',
    name='uncollapsed_bam_generation',
    packages=find_packages(include=['uncollapsed_bam_generation']),
    setup_requires=setup_requirements,
    test_suite='tests',
    tests_require=test_requirements,
    url='https://github.com/msk-access/uncollapsed_bam_generation',
    version='0.1.2',
    zip_safe=False,
)
