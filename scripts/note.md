1. Cutadapt:
- Adapters were TruSeq (Illumina, cat. no. RS-200-0012)
```shell
cutadapt --trim-n -a TGGAATTCTCGGGTGCCAAGG -A TGGAATTCTCGGGTGCCAAGG -m 10 -e 0.05 -o ../mNETseq/SRR8260923_1.fastq.trimmed -p ../mNETseq/SRR8260923_2.fastq.trimmed ../mNETseq/SRR8260923_1.fastq ../mNETseq/
SRR8260923_2.fastq
```