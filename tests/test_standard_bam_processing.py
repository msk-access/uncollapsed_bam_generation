#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `uncollapsed_bam_generation` package."""

import os
import json
import shutil
import difflib
import subprocess

from subprocess import Popen, PIPE, STDOUT


# Global to store output json for subsequent testing
OUTPUT_JSON_FILENAME = "pipeline_result.json"
EXPECTED_OUTPUT_JSON_FILENAME = "expected_output.json"

RESULT_FILE_NAME = [
    # Cookie file from test data download step
    "cookie",
    "test_fastp_out.json",
    "test_fastp_out.html",
    "test_dup_metrics.txt",
    "test_fx.bam",
    "test_fx.bai",
    "pipeline_result.json",
]


def setup_module():
    """
    Run the workflow with cwltool
    """
    print("\n### SETUP ###\n")
    with open(OUTPUT_JSON_FILENAME, "w") as json:

        cmd = [
            "cwltool",
            "uncollapsed_bam_generation.cwl",
            "test_uncollapsed_bam_generation/test_input/inputs.json",
        ]

        process = subprocess.Popen(
            cmd, stdin=subprocess.PIPE, stdout=json, close_fds=True
        )

        ret_code = process.wait()
        json.flush()

    return ret_code


def teardown_module():
    """
    Tear down the setup by deleteing all the files that are downloaded and produced.
    """
    print("\n### TEARDOWN ###\n")
    for outfile in RESULT_FILE_NAME:
        try:
            os.remove(outfile)
        except OSError as e:
            print("ERROR: cannot remove output file, %s: %s" % (outfile, e))
    try:
        shutil.rmtree("test_uncollapsed_bam_generation")
    except OSError as e:
        print("ERROR: cannot remove folder test_uncollapsed_bam_generation : %s" % (e))


def test_output_json():
    """
    General tests for output json
    """
    output_json = json.loads(open(OUTPUT_JSON_FILENAME, "r").read())

    assert output_json["fastp_json_output"]["basename"] == "test_fastp_out.json"
    assert output_json["fastp_html_output"]["basename"] == "test_fastp_out.html"
    assert (
        output_json["picard_mark_duplicates_metrics"]["basename"]
        == "test_dup_metrics.txt"
    )
    assert output_json["indel_realignment_bam"]["basename"] == "test_fx.bam"
    
    
"""     
    print("\n### Check if files are the same from alignment metrics calculation ###\n")

    compare_picard_metrics_files(
        "test_fx_bqsr_alignment_summary_metrics.txt",
        "test_uncollapsed_bam_generation/test_output/test_fx_bqsr_alignment_summary_metrics.txt",
    ) 
"""


def compare_picard_metrics_files(output, expected):
    """
    Remove lines starting with `#` in picard metrics and use difflib to print differences if any and then assert
    """
    lines_result = open(output, "r").readlines()
    lines_result = list(filter(predicate, lines_result))
    lines_expected = open(expected, "r").readlines()
    lines_expected = list(filter(predicate, lines_expected))
    print("\n".join(difflib.ndiff(lines_result, lines_expected)))
    assert all([a == b for a, b in zip(lines_result, lines_expected)])


def predicate(line):
    """
    Remove lines starting with `#`
    """
    if "#" in line:
        return False
    return True

