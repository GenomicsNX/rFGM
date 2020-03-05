# Date: March 2nd 2020

# Author: See Source

# Source: https://static-content.springer.com/esm/art%3A10.1186%2Fs13059-019-1700-9/MediaObjects/13059_2019_1700_MOESM4_ESM.html

# Summary: Pertform quantile normalization

# Technical Summary: An approximate but highly efficient routine for generation 
#   of Functional Genomic mRNA (FGM) profiling (Fehrmann et al.).

# Reference: Parsana, Princy, et al. "Addressing confounding artifacts in 
# reconstruction of gene co-expression networks." Genome biology 20.1 (2019): 1-6.


q_normalize <- function(dat){
  n = nrow(dat)
  p = ncol(dat)
  rank.dat =  dat # matrix for ranking
  for (i in 1:p){
    rank.dat[,i] = rank(dat[,i])
  }
  U = rank.dat/(n+1)
  qnorm(U)
}