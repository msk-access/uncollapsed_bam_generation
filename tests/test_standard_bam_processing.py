#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `standard_bam_processing` package."""

import os
import pytest
import subprocess


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


def test_run_cwltool_workflow():
    """
    Run the workflow with cwltool
    """
    cmd = ['cwltool', '--preserve-environment', 'PATH', 'standard_bam_processing.cwl', 'example_input.json']
    rc = subprocess.check_call(cmd)

    print('cwltool return code: ' + str(rc))


pytest.main()
