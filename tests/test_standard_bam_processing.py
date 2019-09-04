#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `standard_bam_processing` package."""

import pytest
import subprocess


def test_cwltool_workflow():
    """Test the workflow with cwltool"""

    cmd = ['cwltool', '--preserve-environment', 'PATH', 'standard_bam_processing.cwl', 'example_input.json']
    rc = subprocess.check_call(cmd)
    print(rc)


pytest.main()
