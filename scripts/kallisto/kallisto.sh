#!/usr/bin/bash
kallisto quant --plaintext -t 8 -i Caulerpa_transcriptome -o $1 $1_pass_1.fastq.gz $1_pass_2.fastq.gz
