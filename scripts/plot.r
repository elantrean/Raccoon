library(tidyverse)
library(reshape2)
data_path <- "data/T4ph_mNETseq_wild-type_rep1_run1.matrix"
data <- read_delim(data_path,
delim = "\t",
col_names = F)
na.omit()
