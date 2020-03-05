# Date: March 2nd 2020

# Author: See Source

# Source: https://static-content.springer.com/esm/art%3A10.1186%2Fs13059-019-1700-9/MediaObjects/13059_2019_1700_MOESM4_ESM.html

# Summary: Remove latent variables and quantile normalize the data

# Technical Summary: An approximate but highly efficient routine for generation 
#   of Functional Genomic mRNA (FGM) profiling (Fehrmann et al.).

# Reference: Parsana, Princy, et al. "Addressing confounding artifacts in 
# reconstruction of gene co-expression networks." Genome biology 20.1 (2019): 1-6.

batch_correct_norm <- function (expr.data) {

  mod=matrix(1,nrow=dim(expr.data)[2],ncol=1)
 
  colnames(mod)="Intercept"
 
  nsv <- num.sv(expr.data,mod, method = "be") 
 
  exprs_corrected <- sva_network(t(expr.data), nsv)
 
  exprs_corrected_norm <- q_normalize(exprs_corrected)
 
  return(exprs_corrected_norm)

}
