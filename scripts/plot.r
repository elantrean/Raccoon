library(tidyverse)
library(stringr)
library(reshape2)
library()
data_path <- "../data/23.mat.3"
data <- read_delim(data_path,
delim = "\t",
skin = 1,
col_names = F) %>% 
na.omit()
