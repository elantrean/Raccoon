#!/bin/bash
source  /data/intern/fuxiaohai/miniconda3/etc/profile.d/conda.sh
conda activate env1
[[ -f "../mNETseq/SRR82609${1}_1.fastq.trimmed" ]] || cutadapt -j 8 --trim-n -a TGGAATTCTCGG -A GATCGTCGGACT -m 10 -e 0.05 -o ../mNETseq/SRR82609${1}_1.fastq.trimmed -p ../mNETseq/SRR82609${1}_2.fastq.trimmed ../mNETseq/SRR82609${1}_1.fastq ../mNETseq/SRR82609${1}_2.fastq
# fastqc SRR82609${1}_1.fastq.trimmed SRR82609${1}_2.fastq.trimmed
# STAR --runThreadN 8 \
# --runMode genomeGenerate \
# --genomeDir ~/download/data/refdata/hg38/STARgenomeIndex \
# --genomeFastaFiles /data/biodata/genome/hg38/bigZips/hg38.fa \
# --sjdbGTFfile /data/biodata/genome/hg38/annotation_and_repeats/hg38.gencode.gtf \

# conda activate STAR2.5.2a
# STAR --runThreadN 8 \
#     --limitBAMsortRAM 1527258903 \
#     --genomeLoad LoadAndKeep \
#     --genomeDir /data/biodata/genome/hg38/STAR_index/genome \
#     --readFilesIn ~/download/data/GSE123104/mNETseq/SRR82609${1}_1.fastq.trimmed ~/download/data/GSE123104/mNETseq/SRR82609${1}_2.fastq.trimmed \
#     --outFileNamePrefix  ~/download/data/GSE123104/mNETseq/STARout/${1} \
    # --outSAMtype BAM SortedByCoordinate

# plot the mapping rate by plot.ipynb

# meta analysis
# bamCoverage -b ../mNETseq/STARout/23Aligned.sortedByCoord.out.bam --outFileName ../mNETseq/23geneBody.bw --outFileFormat bigwig
# computeMatrix scale-regions -S ../mNETseq/23geneBody.bw --beforeRegionStartLength 3000 \
#                             -R /data/biodata/genome/hg38/annotation_and_repeats/hg38.gene.bed \
#                             --regionBodyLength 5000 \
#                             --afterRegionStartLength 3000 \
#                             --skipZeros -o ../mNETseq/23.mat.gz
# plotHeatmap -m ../mNETseq/23.mat.gz -out ../23.heatmap.png --whatToShow "plot, heatmap and colorbar"

# computeMatrix reference-point -S ../mNETseq/23geneBody.bw -R geneStart.bed -b 5000 -a 5000 -bs 50 --skipZero -o ../mNETseq/23.mat.2.gz
# computeMatrix scale-regions -S ../mNETseq/23geneBody.bw -R /data/biodata/genome/hg38/annotation_and_repeats/hg38.gene.bed -m 5000 -b 5000 -a 5000 -bs 50 --skipZero -o ../mNETseq/23.mat.3.gz
plotHeatmap -m ../mNETseq/23.mat.3.gz -out ../23.heatmap.3.png --whatToShow "plot, heatmap and colorbar"

# samtools view -f 99  *.bam | awk '{print $4+$9}' > ${1}.plus.position+tlen
# samtools view -f 99  *.bam | awk '{print $4, $9}' > ${1}.minus.position

# cat ${1}STARoutLog.final.out | 