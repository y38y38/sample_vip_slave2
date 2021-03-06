#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Wed Nov 04 23:49:00 JST 2020
# SW Build 2902540 on Wed May 27 19:54:35 MDT 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim wready_late_behav -key {Behavioral:wready_late:Functional:wready_late} -tclbatch wready_late.tcl -protoinst "protoinst_files/design_1.protoinst" -view /home/y/project/sample_vip_slave2/wready_late_behav.wcfg -log simulate.log"
xsim wready_late_behav -key {Behavioral:wready_late:Functional:wready_late} -tclbatch wready_late.tcl -protoinst "protoinst_files/design_1.protoinst" -view /home/y/project/sample_vip_slave2/wready_late_behav.wcfg -log simulate.log

