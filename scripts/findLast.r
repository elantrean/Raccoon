if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(c("GenomicRanges", "Rsamtools"))

library(GenomicRanges)
library(Rsamtools)

bamfile <- BamFile("/data/intern/fuxiaohai/download/data/GSE123104/mNETseq/23STARoutAligned.sortedByCoord.out.bam")

get_last_position <- function(bamFile){
    flag = scanBamFlag(isMinusStrand = TRUE, isSecondMateRead=TRUE)
    param = ScanBamParam(
        what=c('flag','strand','pos','qwidth'),
        flag=flag
    )
    x <- scanBam(bamFile, param=param)[[1]]
    coverage(IRanges(x[["pos"]], width=x[["qwidth"]]))
}
aln <- scanBam(bamfile)
positions = get_last_position(bamfile)
# Initialize an empty list to store the positions

# Iterate over the alignment file
for (aln in scanBam(bamfile)) {
# Get the reference ID, position, and cigar string
ref_id <- seqnames(aln)
position <- start(aln)
cigar <- cigar(aln)
# Extract the last position based on the cigar string
last_position <- position + sum(as.numeric(cigar[!cigar %in% c("I", "S", "H")]))

# Store the last position for the read
last_positions[[aln$qname]] <- last_position
}

# Print the last positions
for (read_id in names(last_positions)) {
cat("Read ID:", read_id, "Last Position:", last_positions[[read_id]], "\n")
}
