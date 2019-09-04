#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `standard_bam_processing` package."""

import os
import pytest
import subprocess


def test_cwltool_workflow():
    """Test the workflow with cwltool"""

    cmd = ['cwltool', '--preserve-environment', 'PATH', 'standard_bam_processing.cwl', 'example_input.json']
    rc = subprocess.check_call(cmd)
    print(rc)

    assert os.path.exists('test_patient_1_test_investigator_sample_1_R1_001.fastq.gz_trimming_report.txt')
    assert os.path.exists('test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md.bai')
    assert os.path.exists('test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md.bam')
    assert os.path.exists('test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md.metrics')
    assert os.path.exists('test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md_abra_fm_bqsr.bai')
    assert os.path.exists('test_patient_1_test_investigator_sample_1_R1_001_val_1_srt_md_abra_fm_bqsr.bam')


pytest.main()
