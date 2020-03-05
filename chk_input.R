# Date: March 2nd 2020

# Author: Vijender Chaitankar

# Contributors: Vijender Chaitankar

# Technical Summary: Check input for:
# 1. Genes with low or no expression are filtered
# 2. Log transformation

# Reference: Fehrmann, Rudolf SN, et al. "Gene expression analysis identifies 
#   global gene dosage sensitivity in cancer." Nature genetics 47.2 (2015): 115.

# Input: Log transformed gene expression matrix filtered for low-expression
# Output: FGM profiles which is a pair-wise correlation matrix of genes

chk_input <- function (expr.data) {
  
  ckh.input <- FALSE
  
  max.val <- max(expr.data)
  
  gene.means <- rowMeans(expr.data)
  
  num.means.zero <- length(which(gene.means == 0)) 
  
  if (num.means.zero > 0) {
    ckh.input <- FALSE
  } else {
    ckh.input <- TRUE
  }
  
  num.means.low <- length(which(gene.means < 1))
  
  ratio.num.means.low <- length(num.means.low)/length(gene.means)
  
  if (ratio.num.means.low > 0.05) {
    ckh.input <- FALSE
  } else {
    ckh.input <- TRUE
  }
  
  
  if (num.means.zero > 0) {
    ckh.input <- FALSE
  } else {
    ckh.input <- TRUE
  }
  
  
  
  if (max.val <= 20) {
    ckh.input <- TRUE
  } else {
    ckh.input <- FALSE
  }
  
  return(ckh.input)
}