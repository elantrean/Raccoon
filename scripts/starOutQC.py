#!/data/intern/fuxiaohai/miniconda3/envs/env1/bin/python
# import argparse
import matplotlib.pyplot as plt
with open("../mNETseq/23STARoutLog.final.out",'r') as f:
    lines = f.readlines()
    for i,l in enumerate(lines):
        if i == 5:
            total_reads = l.split("|")[1].strip()
        elif i == 8:
            unimap_reads = l.split("|")[1].strip()
        elif i == 23:
            multimap_reads = l.split("|")[1].strip()