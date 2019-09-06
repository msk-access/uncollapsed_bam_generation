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
    p = Popen(cmd, stdin=PIPE, stdout=PIPE, close_fds=True)
    # todo: just redirect to a file instead of using global
    output_string = p.stdout.read()

    global OUTPUT_JSON
    OUTPUT_JSON = json.loads(output_string)

    with open(OUTPUT_JSON_FILENAME, 'w') as f:
        json.dump(OUTPUT_JSON, f)


def teardown_module():
    """
    Delete output files
    """
    for file in RESULT_FILES:
        if os.path.exists(file):
            os.remove(file)

    #shutil.rmtree('test_data_access')

    os.remove(OUTPUT_JSON_FILENAME)


def test_trimming_results():
    """
    Trimgalore results should exist
    """
    assert os.path.exists('test_patient_1_test_investigator_sample_1_R1_001.fastq.gz_trimming_report.txt')


def test_bam_results():
    """
    Bam and index should exist

    From both MD step as well as after IR and BQSR steps
    """
    assert os.path.exists('test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md.bai')
    assert os.path.exists('test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md.bam')

    assert os.path.exists('test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md_abra_fm_bqsr.bai')
    assert os.path.exists('test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md_abra_fm_bqsr.bam')


def test_md_metrics():
    """
    Metrics from MarkDuplicates should exist
    """
    assert os.path.exists('test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md.metrics')


def test_output_json():
    """
    General tests for output json
    """
    assert OUTPUT_JSON['clstats2']['size'] == 1904
    assert len(OUTPUT_JSON['output']) == 4
