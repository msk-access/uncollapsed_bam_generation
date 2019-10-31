#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `standard_bam_processing` package."""

import os
import json
import pprint
import shutil
import logging

from subprocess import Popen, PIPE, STDOUT


# Global to store output json for subsequent testing
OUTPUT_JSON = None

OUTPUT_JSON_FILENAME = 'pipeline_result.json'

RESULT_FILES = [
    # Cookie file from test data download step
    'cookie',
    'test_patient_1_test_investigator_sample_1_R1_001.fastq.gz_trimming_report.txt',
    'test_patient_1_test_investigator_sample_1_R2_001.fastq.gz_trimming_report.txt',
    'test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md.bai',
    'test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md.bam',
    'test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md_abra_fm_bqsr.bai',
    'test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md_abra_fm_bqsr.bam',
    'test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md.metrics',
]


def setup_module():
    """
    Run the workflow with cwltool
    """
    cmd = [
        'cwltool',
        '--preserve-environment',
        'PATH',
        'standard_bam_processing.cwl',
        'example_input.json'
    ]

    print('Calling cwltool with cmd:\n{}'.format(cmd))

    with open(OUTPUT_JSON_FILENAME, 'w') as f:
        p = Popen(cmd, stdin=PIPE, stdout=f, close_fds=True)
        p.wait()


def teardown_module():
    """
    Delete output files
    """
    for file in RESULT_FILES:
        if os.path.exists(file):
            os.remove(file)

    #shutil.rmtree('test_data_access')

    os.remove(OUTPUT_JSON_FILENAME)


def test_output_json():
    """
    General tests for output json
    """
    output_json = json.loads(open(OUTPUT_JSON_FILENAME, 'r').read())

    assert output_json['clstats1']
    assert output_json['clstats2']
    assert output_json['bqsr_bam']
    assert output_json['md_bam']

    # Todo: why do these have the same basename??
    assert output_json['clstats1']['basename'] == 'test_patient_1_test_investigator_sample_1_R1_001.fastq.gz_trimming_report.txt'
    assert output_json['clstats2']['basename'] == 'test_patient_1_test_investigator_sample_1_R2_001.fastq.gz_trimming_report.txt'
    assert output_json['bqsr_bam']['basename'] == 'test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md_abra_fm_bqsr.bam'
    assert output_json['md_bam']['basename'] == 'test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md.bam'


if __name__ == '__main__':
    import pytest
    pytest.main()
